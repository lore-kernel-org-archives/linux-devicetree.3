Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563360;
	b=LPWxXyJ+0f000c66boQSCg6FP8aoZZ5/deK2nIiCnx4xWTaBufihQ8ESX6ZQlPsuSaCJ
	 mp5qR/ijyzSqXns3xSImTfJIYVUUvaJvthz3dbq+M5vubpaOS3mRQE07z5e9f4pL3UEQb
	 WiDw5vR4bk5T59AibTPkmXH3uMVtynyTsdLi5Rss1YLbvZVmx7Rxve2kNVvqg3EPOfVT5
	 5lMAzSzc7jfkMgHZfnSfC4oC+3cIw2+cHsW1RD7CWl8hCupSV7anelF1CxSCmZikoK+Ms
	 PC95JgEao5eXCVgHuZ+8ROl8/6OfoYs4l7eYks8nkl7+fcPDiJWGs0xGxJaHiI0j8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
	b=AfImnwAAg0fNUyxQf+5+GG5bjU9BhQBMgnnUFFL4IEc7TwbPPisDduVDd3BH4J52SgaA
	 ZAom6804H195jMdCaLscTpPXwry12ns5AW8I6UsibFxBGvFk69uEUv1E9fS8qb8oF+N6p
	 EQVYVLWjxW1D3lZwn91gsRe8+WaD298Bui3Fx7zo43mtt3esLnznODk2RJUabyF6gWpba
	 AawnWpR3+n25ZWD2WZvmu4BV9QKyb/mTeO4Y3S6K82MNpIH7I61DXWe7LLEGZOef6YxLx
	 ssR5EJUCILG0JK9kqDOQUmB4aWpFPMectZ1uZdjb58TtoozV8KfOxjtqVf288zfc+pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D31606A332
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 20:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D31606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQF6h2044113
	for <devicetree@vger.kernel.org>; Sun, 1 Nov 2026 20:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=; b=RnrS5jaDMLFh7yHb
	FOvBqHQ6sm9ULkxVT77GWRj2czp81Wf8heSGdy5Ptog9z5cO5T36BxYcY+/0Miuc
	UqguzFzwPRBlVyqdDjlUuyup0qkBKCeuUZwgPmpqsnT9JWPS9jp827eSETH0I6Sv
	lrzdYZ4irG0o2n2HYj4Vc6s39gt1klFRI1dVRyETAARiIetbu8Nrtg/tJLWPf8xX
	28qAUuisyifYubKnhQsSRacC7gS1xzlKjLonJQmQN8OpWfUzHAh8Np0ZkdZlkxIB
	m4id8oYhSwed+zqKxUz63I8JuQVJ86NSujmqBBeN4PpuYLNzsXdnGNJXDs2CME4n
	wZiE4Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxm4c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 20:02:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b160a0ceaeso24256637b3.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 12:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563358; x=1794168158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=UzOF0+TPAclUTvLux3kmfar40Ay7f7D0EFJC/28AjBIhRdqKtnL0ZnrYuDtSJO2V5b
         Okb0SKcVZ8CP7NYyA3RJr3GUYI0bXLOKZmWobK2eFM/g6VOyNNgZm8jWJ4lFJqDkRjhW
         GjWgcxiFiVBQPlI9bAqD9AjW/PM5iShEQxBB1bJvwSbglDoBmE9Luf8KR9o144BTZNua
         sPh3sT7eOTSdjE/f6spqYeI0qr872n3fGBVnOSFuLgvx5YsqM1+We9MFmGAXxGfa+x8E
         nwxuCxJf4nFkyJWlUIXhVX3488Bo8+Ld9THs561fE/kUGc6+6Zj6HrTMWn9wvzywnFGc
         xrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563358; x=1794168158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=YSV8PsagCTWvKIQ8dGEL7xWLzMt4kTCUzxRpJKr/zkdOrItHPhCyc7z39YgVcGJnmf
         k0lD0d0sjfCVuFDZ86HwmAvhrpaFog/ANjkEKCLPdiHH4ZReyUxLBhKzIb18SanbRBfq
         WLYag/md/DwEepwpUTSJAlrTDRd7mADa0P8BXVsO1HplQXC/1zD+V71o7wcbJN3V58+Q
         Shn/p0E0dT416YgFGIVFyNOq8k5yOC9Lg7SwVLAFrIXP+1K4/8H4IXUqhJXOWlH5IQVa
         C5I+DsWMkoL7J6lynV6kDVhzmMJ2NMLT7V5s/peGs6WKyQPXnQeWvBU8kjX/AcYI/Xi+
         08HA==
X-Forwarded-Encrypted: i=1; AKwUvBwqaxhcBaelc1neGtjpvuC9uYwnxODc7zU8F2C/YYPmrEQyPvTl9/ZJ7zy3R6Uzr3kqyv5BrI6FBOMz@vger.kernel.org
X-Gm-Message-State: APuU4Z9N3vERmAd+d/xZgHC8n31KHA+JZ9WxALjL9k2cplgPbk0y6dnt
	hIg2Fc+bM36M/0jrVTnV4jt9EFqBadzgXLUjjbnLWa4YIsw7tQZQHR4IgFmrJ9DBzUGYoeq2I7Z
	modoiion8WLJyWk96UOOO/LxkBq92jxq9MfdRc+MyEjyYaVTy7l1368LnMX2sDHlx
X-Gm-Gg: AYBFou1Me6LEt/tcpfGMaU0IylUoH9MDoF9+ZmWD14y7Rsvo6IY9HzHWFDGB8Ew1KY2
	bp7fVZltAmcQtJDD0Zzl2Rsjbxl3+JjuazfSKyGkQqIFokTGVz3FVKjb1ZcS1jIYiOMs9Ul0Wkv
	t2y0mFwpBPeQrWEdXXzazD4DOKQK/IW3f5ZcuTmnpsyKzHZE9IEBTgkbGAklV6k49qiRrSENyol
	5sc1mKJ9/R2g/Uy6k8Iw9NrpiHaejKlQLVtNYrAQd7jVPxJLzZ3r/vxE7r/mC0d1uYDIJqn3r/J
	yUOWiAjexWk4U6uLk+E3JOLmSMxnNeUp7DlD5xEUHdTjE0JS97+GoBpUSYVmSY8F7uayiI5Y+F6
	0O0QuPo5swHa7DzAOuBBj6evFyACTlUiKzXYe4UbDIYZOTL9cgcBpZ8zQUBF/1H5baA==
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371557b3.20.1793563358391;
        Sun, 01 Nov 2026 12:02:38 -0800 (PST)
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371387b3.20.1793563357976;
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 12:02:34 -0800
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-hp-omnibook-v2-v2-1-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: MAbm4qK_MmpBFr3fpz8IlrA07EhS6xkd
X-Proofpoint-ORIG-GUID: MAbm4qK_MmpBFr3fpz8IlrA07EhS6xkd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX0nvNS9kB7lU7
 vEh8odMlDdZxXFjel3jKbJ7anHlAwqdLLN3RkgEHAZvMo7eSOiUfvAELFFMaohXNFVMk+oh2bwz
 7B8neD248VFJUBy6rpr4PYKRt+YYeLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfXxW4xlcXXkYAL
 l6/YZYSuT5MNTwhrPKj4Xty83til2mT+urzclc/oQMqebMjFGGYtQl/AEFgVMU1Zn6EJNoa064a
 4mFESpChWTtvjgrw9UjVvxDmMqy2osl8/l92E+2JqX8SajTBIcE+Y+UOBIinbiZLUWZ5mXwuShl
 qA9+Jww/DQXk7YJgUYwI/3c2AsbN7ELEISRFXDUaM24ACEHo9use3njjCoShywraNhaedJd24wp
 h57tQ9H9dnQAr6lQN9QDJP7UhRJi12ooaVdWPR5iP3HviXtK1yd6I8d6IQytFnNQGbyVmyK+JUV
 M9wE2wHIk9G43orZ1LkwXYNV2eiPGS73aaBhRgPAzU46TpOKp4O09IDosxadbnmGgZv75JOO1qJ
 S+UC1bIS+TNqbdX5p3bRitNN6tD0nCAMZILaR8l3iA/JbDgNo70/mVvtDL6kaHW1gdy02/W3ndb
 JYACJjslb3KL0GA5Srw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae79ade cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

