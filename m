Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EF480DCA
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450911; cv=none; b=HtIk4IkrFzYy3BMiV+3sXA/uIjh5kna6Dva5rT59p6XOZNC8g7l0G6PfvAnY7os2K6LGzY668hblw8rAgUUcV/D7g+sSAG8nTsJjJar0t8t0nAcI1hS142Xvt5IGeUy8QAbDxhzauf9rCP7NMt+UfDh+VNYNO+8AHLqLKce/WX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450911; c=relaxed/simple;
	bh=WHL5zca585tZmg3vsyLGxdRvHfLLpaf5RO66L/4fym4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOMT09k/kZd4td9FLLZCjewsHeBLHalJS4XRh+6/bqmRMnIcvMfNwLuwjGSCpoY2dvP0BmirT/Q5lTYb+Vzdm9KYRtVgYd6dnlFNPX3n62GGlEY72MPnYwtaegXtROhvHgw5aiGlMQpO117CVlunYUPPhut1+dF5JEDCW4oovQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W96p41od; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWtbRK07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W96p41od";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWtbRK07"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBOi2189934
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=; b=W96p41odhP/5ZhtQ
	JyUnrZO2VABmpwKnKlw50jGP5iwX2O3EvmMW0onz/YWU5hYw+fG5509uFh3ADxPU
	UDcOZIb6F6qJAVlo542udPjgGxSvP1bgk225M3BpG47eWVQRR21lcQVjazuvuQvP
	EExaDTP3xY0QosFNgjkxzMOYgdB3pFfS2xKzccE9+coKlq6Yw8bIE0K4VMxyKgIP
	pgufa8oyatyu1qtAV0JHKEqBN3qyd9agb3MFacY+t4zSHkGQKLBqaLxdLPGGv+gQ
	cjSf8fqRwjVJiXy4+Nv6UAnubCQVO8y7KHeeqqTS1ovjSIKi33c7x1PRsZh0U3kP
	20mx7w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:15:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so9741179eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450901; x=1792055701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=;
        b=bWtbRK07/jBQln5MdrPU/6UbWC2Sm20bQ0T1TLR7ZrxNUUQ4FPOYxIT0PUHUJ9pHD2
         GTvKs0pbCSYOtGrVXm2KNCoTvjB8e/O+3U4xrl+nbgYqYeRGIP2HXYbck0Z6Ue6oivae
         AyrlP41QGulSywmU0xShs57fMrTwjxj6xxo/sNAcMknUzH8FOS/0+cr/A2hTdzrXfolI
         QA8wfrtJP3sEO+VFI4UJ7o6lVQsreAgFxgZo1KsTcAITxuCxD+jWMakAUa3xG8aNak4f
         s3XF74ZWiphO+kc9SnOyDy8Mawu5FQmXyEW79KBAnFSLXhYIdFDAg4b2MjwMJ6yzyEix
         txMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450901; x=1792055701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=;
        b=hZXRfebdozj1lM1auPTKV2s1jl8FSO77oInhxdKQsjvkpBi6tSq1Zme0KLZV1waFVQ
         fVFv7N8GimCHuR6zWzbTTAK1mwFhGgUaA/0xHm+xHAtZai491Car3OdC+2rDPxxoWErh
         Wla5V85Xx/SyeilMFSjlCD3DSWFnlp8wemE1XmZXSGHOgGPZoY8VJnVdJVehl0XdAkSr
         geAvCiPuwY8Z1YLgi3TetvW0ha7UpyERIssw4Fotb5oR7HJpo+RweXr+2W5BbvYH0Ogr
         FasZjbiQ4Odiuj7C+f2phMJjrxIHbbUytsQ3eGky24wVSYehWc3nWaWtIDns/5IIk4VT
         +4Xw==
X-Forwarded-Encrypted: i=1; AKwUvByi4s0Q/3r0PRgkPqvwrCtjAw0Lp80m3yBFVFicLnJpYhkXn7fCRQ9f0vHOsWuB7RJeLGjCy4CxEHqE@vger.kernel.org
X-Gm-Message-State: AFuF++k06thahuM2uL6sywedfTCzruRXwENuOY7jFSIjAnoz/X1rMIGQ
	ZF1WGM/m/AIHTMhdQFa95EzFHqmvEW2yjgkw+S8T04htCkqiOaHMH0lvVOoR+GjDtL0OcXK7HLV
	EpOnV3UqHPqKqj7ngkZ840etnUbF64YX/wuOw/w7xOiqPVAKHwdeAvXt+LYUWXxaI
X-Gm-Gg: AYBFou3ZtNaFoqAzjj9Q9EGUHHYlZevBTSxYTmfXFNmvBnlbaRCWEff7LqH6M7BCj2d
	TbXyL6pzoeQgR6B8Pj8wj2T0/OFrBHIDyGscndxjwIAOjqWtKcSrWKN0Uglcj2URpX0KuVqvfUT
	TK08i9AFuCdBQVC5CId4TOzuYmks+6wd2GzAfb4G9dDYWPmzfzX+ZFA1YrLdxRxb8S9OLNCX80c
	136grPbqZ7z9xb3eN22YCVh9faEYjoDx/JLj/CMuk7XHGj23r3Wc2fIxx96BcWSlLMMn1JNhq/V
	GVSuxTpzUt8eBd2XdHOeckm0eFBg2HTVcmMkqIl0Hfs1YvOFBmthQYxE6+tBnoOxqd6f2jo2sf3
	bqZbQ7JgsAdOid8ESKIMFWw5QbhMwLCx83kFXRsoogmTwh9bgujzUe2DmfroApKMuP/GLjNsPcg
	t5S+a/eeHO3ubJLCC/HYtALKuAIDE3
X-Received: by 2002:a05:701b:270f:b0:165:8e0c:1886 with SMTP id a92af1059eb24-1658e0c1f22mr2841425c88.25.1791450901114;
        Thu, 08 Oct 2026 02:15:01 -0700 (PDT)
X-Received: by 2002:a05:701b:270f:b0:165:8e0c:1886 with SMTP id a92af1059eb24-1658e0c1f22mr2841390c88.25.1791450900304;
        Thu, 08 Oct 2026 02:15:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:27 +0530
Subject: [PATCH v6 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-7-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75f16 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX0/pai5x65rrY
 uqGO7iJ6uLyEso9nNKAcx0K5GyHkDLRD1DnEvTXyvuc/QSf86X4h78mXcL6noVpqmB9Z7BeGMkU
 TklNp4tNBG5mJG76cHFBn+ll+yd1S38=
X-Proofpoint-GUID: ZW2dRSvQtnaXCtSCogYgSXjPT-952Vn7
X-Proofpoint-ORIG-GUID: ZW2dRSvQtnaXCtSCogYgSXjPT-952Vn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3dT1rt79BFD7
 cn0mbWISQ3s7lmu3PmsBgPpLa6I5ShR1uPYFR7778c+NAxzScWUeok7fC9r6foO0cQ9clJNSapd
 c1mszl1yznQ8hOFCpuYzUeNNhgbGh15yRFZ4ethfdre49DabZ+GO+FYpa4GF7S1HfrB4kTdZp7q
 LvkBBe3SLhP9vzBdZRB/FPmf1LHKbgIE6Bb6g6c41uyQh/L8nD35T2+XpZiPBU1+JmQmuIdwZYn
 N9S8f7ZyuwA44ZwwY0U/Mhx5e+nThjVtmmHAesm0iTRaJBzmWNYhzazxs3hvZ1JKkcyBy4RMb7Y
 GfNS6V4VsshDN2Zjh4Jt9AjdLCVEfv+IYS3VgRfd/ll752PworLqj4aRfMPabefHvP3uln00JIJ
 m6FbIsBNL5KDLFiavY0rLLf07GLPfS1xsDixzVXXl9n4rXQaD7yqr1kZ37x4FU+ueJKZnoKhMLJ
 Sp43UOZU9cG/4rqe51A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index bc9502328738..9b6ebc9f59d3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -392,6 +393,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

