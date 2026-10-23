Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743236;
	b=044J+Lw189Xtf9jR0B3TS6OGhl4yGyLDa/db5SkPr0Hyarr0IWpxq2btZELg/Y4+OFcS
	 UPcOw013XaT43rC4EAZZ209+ePEGHo2HRwsgskSmF0oz2wU5fGPEQoe+xBmSOsyY5dOhT
	 d3tVP5Gwh9rNQjrXzxgrHS0o1+Rf07rNhGRjnzBKocxfymjQRjyMzswDWBNjSac//SEuW
	 hbrsTH2wBu7U7dsgl1ydMFLjNlKfSolrL5p+7y0PC3X/M3uUO4jzgLuGsB1HWwWpwxfZo
	 7+DXR6GxfBApC/pklIQPjEJx0KJNsTZM9vDL1zpWz+Zl9vJPvIGAOxMpmymU07pYw/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
	b=zWuX8ci8TnJE6E4ds7UL/uTXQd038OzV3hchSa3ryf/yxr3RbU9fQnhuhPZcSeSwrguR
	 yMgtSTUUe8qmyYqr7p/hEEzLyaVIyMytVIw8aZ9JlTxBVzVGyJ+AnxE8wSm1ylv75Cyq9
	 vOIuaw0HfpE+ragSPEFptQQFcMPNuI0xAQIhUfV4nRWBIJxhreoXLHhveRnUoztEOhSg/
	 gdgM5IyHllthmg/OYSyHF53iEpypnDyFssVU9qD16/JCCyJZ864Y78brjzdhzaHv3gp5V
	 +8OOvHdJDo4Efz4oIjjMEQfINfMBFb8L34ZVJrziG/MY6dCRnFNPrK0ghNEpBV3EEZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7D4606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PI0xYDhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0aisfE5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F6Jm1200774
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=; b=PI0xYDhQ4saNVgKA
	yA/jd9zqnE1sjB1euDP+1H9mg9nZaC21QRdCTZyvzTSWv1juXqVm2CXZEShk1Su2
	qXu21l+QZIq2RoJKEaJLt91vgJH0WFwBXodmouE83aKecv0z3rtsYa7euEpxDTNW
	B8qUamqPjmhEmL14DwiJrfMFBxxkxRRN5JIZ09tuR4XpEj0g8LeHDjp3f2qpheF0
	FwaGzfeFiZAfouj2rnkK3WQT5H1t1PL1tD44w09p9DTrpyrtQCWMzgY4akdc+bq6
	g+2vR7ihX0uK9b9KOL+YCVC9bYIGK3GhWcusXzOk0YIatC40ZnpMGLRamEtw5Poz
	9ni4VA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2mx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so115411085a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743234; x=1793348034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=D0aisfE5nx6Uf6NfOeBj9sqbzSO3q9xyJwsNN5lpEZM+p3vq3sXOVVjWC9GysDijI9
         vfd8+6sfK/iQqVwSzumpbODDOkSfOtZQtZDkHGqUu0WFUGW0TA4y6jtiam6rDDOlviY0
         xCCN6O0e+eR6cMwBnr3iZKKRHIStsCfnmP98/CtvPzEqLbwoGBR/MCH3slsToz0vx7oH
         cX6XZFWdF4Bm4ulWX4KSINeGL7hzxQCwF+j+GZWlqQslKZFANlbldLGkDKD0mGULoiMB
         NlVcAwj1KB6qgzjAwb74CXMVglG6YqtHPoyQpN3jTr8wXiLKh0z6aePOTwRrnmFJ6dm9
         hOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743234; x=1793348034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdRIw8it8cCmifIaL+Ne4/v9Isf9Dn09v5JwPLmDqjs=;
        b=RD7i3UBnPBX+DsMMbPzqA2RzpdHYT+Hp9tiQGdbwpLdYP27H9eJm5vu0ZZS0ZI5jsG
         RXqXgkeV2BkSasAplyT6SfaI1R6DrzhzN4fdhqJ25as8XUN1zYzeA6IGg4kIU1qYNUpQ
         BOG/vU4W/Q5oWu85UmKYqEVnRKy7uE6fj5uiRRyxJ7Jk+Tc2Scwq40wbpmbnPIPzudvX
         qaGP2mrCksoYt49RJQ+vrMsJV3RUBcsocetkDWGx4p15Cp+oBfwHI4WYHZrjVSDBZiAB
         4B5HgjFbF/ZS2XiC+xyb6bu73EyLKBP8e1iCj1/D+HB0u3ibiNMq2S4kGqeGU1tzr12f
         s+xA==
X-Forwarded-Encrypted: i=1; AKwUvByDScyRr6Dk8aRB4MRq0H+EsjpL7RYOZ4mSAtea8s5nb33w7Ma1mvmS7mfkDLMV9RM5wY6r5JDMRH2k@vger.kernel.org
X-Gm-Message-State: AFq9FYL76BSxxqYUc8s3Wqy3eWJknkyJaJESVTfh3i3DhAByFjMHV5XP
	4jpLPXIm6D3hNeD4UL+JU65HTJvWazycQNUDnc/NE2jiu01hFbxShghU+noquto7r5Ymu/fCVNy
	JcHc6qao2iizwLk9AXFTz/9DStcFDt+6wPeTYfmotWupQNHL/TsHkNATZOE8q7SW2
X-Gm-Gg: AYBFou0dVZekMRva6ixksT0xkGz7LNZkYfuNdkw0+JP9aQlRjI+f7IL0WgQOdjkXNKL
	TZV2L86O73CHgqDOWGX6w8fbNP6OsyAMapesQg//KlSo9wwjdoiTYykdTP4Tk6HNNSu0IKTPyqj
	HreG9K/HF1zObaVvbgdPCHR1WmGmgk3WjB5S1Ih9V4K/yBP9zD15eUhhaj8DwsXHHnY6eOIfAVb
	x4HOREkoFWL51kimilHl5EsVYgQL7MjYIrT4W0sBucw2JzCspBWKgcjidclSaZ8ir1/hc+ECrR8
	DHsVH7PrS4BMNUV6Veso7qGWdjVuONlWB/S1ZuKU6zzHawLyZar7pTMBjc6AgPfOstB+yJ1s7Gd
	ad1aiWTCOlCpajQv/HgrlOuMtGkJBFeWxgVXIoVSrCmg08GEOHHe1kD4HTMc1tg==
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288288185a.67.1792743234348;
        Fri, 23 Oct 2026 01:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:93f:2a95:a503 with SMTP id af79cd13be357-93f6f8a89a4mr288284985a.67.1792743233908;
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:13 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
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
Message-Id: <20261023-msm_gdsc2-v4-3-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=1229;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0e3qRwa0eUGU6w/ynL5P+jJBBY2ZfPskYSfmy+rlycY=;
 b=tCI/OGTgkGp6W+rpS0APS7T/OQoO2IecXPOreqBc0ZRsu/DSgV429WyY+mj6uTd8rzy5KXdGM
 0ho7tGPSDrKDCqhc3hlXbGjqPj7b0WuzMT/94IQghTX/z3mRIiyaWpd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX5hdrLXOizxnn
 +ycOITvbWYqRc7vG1QRlc0ConqnM6ZIZci6Gb1WSXzcYA10MWwxhHMLLNxQtfYvacZ5w/vJEN8Y
 bxjr9+o6vYToZinwz7LEZzkQX4PSEw5ov3sl8stOvhbHNq1Qa6QiWJ0Ldr+kelFDFAP1TTX33Z3
 9uV00eVg4gx13eMYSw0ZBE1eRoZ3KXpKwOQlz/e4d/2gqL8m2QbDpRtyiX0oJPYYtgEv4R3hGQN
 wRemjVGWni8UKdO2IAOA79FIuhg4chwuDkKqpSbHShOb2RYTzsxw+YgOJztxH389iO+wGkyXL1O
 YEGZg1qOuzFE4Nb3lM3lDD2vG3N4cb/bqSyqJEa85xjp6klpy1G8iuCPznDhMYReCjvSEhjaB4l
 Esx3MR+bW41/gnb6yIC43HcU/UqxLkNFgeHFmZ9YhK2/HSFI/8w5aCimWd4QlmTjKYTbPK81vki
 DoLoPpR+KgFOlvSh3kg==
X-Proofpoint-GUID: coGh1IITse9y8opd3CUA-PIoMaT36ucr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX8NcS2cSuYKCG
 /MXF/gf4G+DU9SWLspdTuvL+xrtY7ACzT4xSFkH+ltDCiSPI3Pk0xcWSkIFtkdAYfcjk60MMAi+
 pH8yXAYv6d5lny5MStOdaEvd5trQQdU=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb1743 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GwFvbCpr4qPuEswRa30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: coGh1IITse9y8opd3CUA-PIoMaT36ucr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
source pipes. Without enabling it, these pipes remain inaccessible.

The DPU is supplied by both CORE and INT2, so describe both GDSCs as
its power domains rather than attaching the DPU directly to their
parent MMCX domain.

Keep CORE attached to the parent MDSS device because it also supplies
shared MDSS hardware outside the DPU.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..98d367b9dac7 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3674,7 +3674,9 @@ mdss_mdp: display-controller@9801000 {
 
 				operating-points-v2 = <&mdp_opp_table>;
 
-				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+				power-domain-names = "core", "int2";
 
 				ports {
 					#address-cells = <1>;

-- 
2.43.0

