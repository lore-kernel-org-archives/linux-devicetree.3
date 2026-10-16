Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B33A785D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129213; cv=none; b=TU0q8ySY7gBs27uPAcVTj06EbO+MCjy9SeoDqzgtwSfXOP8wjqseMKnr1IKga9iMEjjRv/+GLbzw5ehMntqO5ejQRt92eAVxvE6Hv4k2Q+8+TqTo7bumLVRa5C9WgDzJRSNNJdhLgvxPpOm0Emot0soA5Byj+uc2qBnLqYbWhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129213; c=relaxed/simple;
	bh=lOl+AgLFVl+ybK4WG9cbTQOJi/XJ1LFnK4djym4h9sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6gmSW7Xm/e4eG7H/KE5GwfMdaDOJcAv/t8XVQgg1maTOzvUYDLaatcsgJMVDw8Dvf9xAofVw3Tx8vIbs2rJtkY+T+ZgfdUU+CmT089FE3NfaUfEYenfqok3Jow8sRnwAzW0o8UcwH8LXHWgbbIZR7FYkMdh4Ll22GhYXL6viPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJnmiKso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSOgSJN3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJnmiKso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSOgSJN3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G27Fnw3202386
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=; b=LJnmiKso7wNLCH8g
	/4Wb8EhBNjd7pDOx8TCRvNYM1pAgUKC8NFHPEhRmsgk2SAjtjGg0fZC6MmTUWN7I
	Fr26Dto+Q1PdDMS2LxPXM0x9eR7MReRykFZ2AaNsoOS7JQ8U+pK76/tCBjJNS4Zm
	z2mmqxvaWCI5WtYm8rkVMTRfInid1DKztD38DihD4fE5nHZoNGQwjuc2Q8P+OfYK
	BdRz8BwMwv7KRgAEAfDi79WdUGu28Fd6zSzUeZON91m+FIrvA56XrskWLKy+M2LE
	YGi18tgLabG9Cw6d3e6fkPxlSB67qhbJ38liQJIlV1707gJAiv1/jO+Mt8XC35cl
	mXZ4dA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3a7v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so8439275eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129211; x=1792734011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=HSOgSJN3ccJ2b7DssM4DtBKqCRBzm9tImIHanc1qHvCXmpsNDFtovrtAU8f3eQt2Hs
         MlEM0sWD2t7fenEgWU7ibrBlyuijT362CmchLnS7sEt3JNOjQRKqQAPBYHJP24WZ8t3F
         4KuNfUBfh95UgN8FdeKSFldrT12Ti9RTYVanTsYURODSjLkrwD3Yz7Wf/k0rzPPFOClt
         h8T+rVVAhjJsQQk8AWKu0mjqOAWHBCJzDoiPyR+zzsnahWkst1OVRo53aXDsd/q5U9Db
         ODCapS1KIfElSvfVmHO9C5B3r17WEx9owmq/FVgAMHbTr/4Kyiv9FCVCVvVm1oz0Hjoa
         Fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129211; x=1792734011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymEESyJ49OQsClKV3F7te9SCrhSJGIpbbzedDIlzEnA=;
        b=VLM5R/3Esb0Ciofnt0v7BvP+UHSyOXcFDMagCh/vNUR5imDm/WsMvkMkeQlXyJe/hp
         9XkeneLA9vPM8WfIEhsL0CCcRFEyj/GDRylrHtjNaNz35wCUUho/wauG0RAPYOB8LKQn
         qcXboVEB4sVGNNSFniMpd8N9IF6dCVWSxgjb6ElAMO+Y28C3Sxwn1yxovb7QqJKnlTPm
         TiZHtCRSyTn48E3tImXxjX1Ym2QLWUFfF9navi7OCAJAtlFNrxKpAHXmEWtJMcOnNQhb
         +uxAs4n+I47uj1AIY305/QaosBdeGwEpptrPOy5SPUOZVm3fdBXoDB73wWfeZxUWbjm3
         KMrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzWb66a1+NjfXLB1Caq4hOgeBkUBESW/SAf/E5E8DhX0PQRogs5vMr/xY0eo+0pJ39vSwI3G9QCkn+@vger.kernel.org
X-Gm-Message-State: AFq9FYLRR61wglJ7s4xHwTBOGYKwC7/nPOYq1Q84dKpF2xY8W+4zXXS5
	k5xJStXTwzf1ZCS8V4bBf03yGVIvcbCIwtllAYpo5inZBNYz1gV1QqHG3pMsuYfZeBR4urhabVW
	nd0kkFBYzBM4C2um23lNQVQN9tLOskqCTYme91d0LmPvHHm83xhhpfmvKp414Q18Q
X-Gm-Gg: AYBFou3pNvbIuwvx5r8q/5K6MN8E8THMRCzju9AT4cLQKESZrKEc7H5dLNxHvxGyQ3w
	5Y0oFBabcob517rQ0rtmJ7Pp3FMLEqn+kwtSN1rCjyRLad3XZdbLW9VGEAwltVEIlBi/R9rZeSH
	5Q1MPt8IHKD+bj0MhrPiZZ+ktujw92g/xglavOYwirUWE3mBcY6xpXfk4yGC2hr7D2Pw/vCl0uR
	mJa9HWsVObmtIK3e83TJlCPIws9lGzlzO4oY12VAuaX6JZ/LGC9dJiYrx6O8UbqAHbQRbWUIaLr
	7GQsNEKoIS365U8F7A35vPuppdFE3p4XeQKp8xYtWIBixtewtIy+Kniit8xVc5FtMJhyxbjbtuC
	eR1ChhM+z895M565hB6HvHyoewWxItD8RH3j4
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1884eec.26.1792129210875;
        Thu, 15 Oct 2026 22:40:10 -0700 (PDT)
X-Received: by 2002:a05:7300:f814:b0:361:1dd6:531b with SMTP id 5a478bee46e88-3611dd661ccmr1856eec.26.1792129210348;
        Thu, 15 Oct 2026 22:40:10 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:09 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:55 +0530
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX1TtC7D8irJRi
 eAauAgVseIWs9+a6sEIweyg1/69hlpJgJXs9VRgziZlVWE4tok0OKg5X0Jjt9MNKvd1eKVJTrkF
 xBKlKMwzf6zbk6Vil3nqdA0KvGLvcz2rbcJUZXf0YT7+CLykacNmGPz/gjrYHBrk13oq7Gzx7D0
 9/BfwMyU87pBGJpGaQx5HpgvlfwGxLmT9ISzctB3/ycfVMwWfar9qm7mBClSFqIJHx/A0M3pShK
 hOUI7v8QsrGiUxLANlxcw9uIHmmQ+435bMHIURRGWRgZ6zVmXBG6fV3nHTLqI9oOZVG40Z0qJEO
 JPXvwhC5KXM602QaAL5hn4dDJ5T2cxN3M1+d/nQNuAFlZvuprO7Fyb/Z/Ikh3IwkchUTkK6Xu2l
 oeoBmftFxx651i6ypm5cRQX0o8lV6lQ18Mu8G3SwCR1VPLXHsrTytwit5xN79WxaOCsB1yQgI6y
 zEf2z5TES/DkNr480Ag==
X-Proofpoint-GUID: TFFTx2e_ZoW8FAYElIjrEjX2XtDuJQqW
X-Proofpoint-ORIG-GUID: TFFTx2e_ZoW8FAYElIjrEjX2XtDuJQqW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX9oorfIksiMob
 8ptCm7yoos+47kR6+U8/6wsQNKD5VcWwcVb9XOlWlbJRg3QociyfYQNntgA+uM5PyyOJTtmPVET
 vs6mjC33vrIooumseVJFK2GhUUVIli0=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1b8bb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hST0b9sF66eLrQ0HLjgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9db94c3b0c91 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,12 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp{
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0

