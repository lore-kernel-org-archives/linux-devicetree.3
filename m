Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4D2253EB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811978; cv=none; b=g7mX0a+IQPQeo4NWAEwmUT3kNUQ4ireKFU6rzqfpvQ3zrxZ/e7tssOcuQWDW0AphynP6+5fvb2WLle0mY6y+UToSTkRVcJ7zE6jTZj8GUL8CS8Y8JmiaPRLUpmDFRj2B0iAW1FOqupWv3r3hg0whsj2bv2Is/rFgxGuMj1+TLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811978; c=relaxed/simple;
	bh=iqb+qejASsv6muwZxrMr/S5vhLSFvP1vcVumV2XPiiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJM07rF9W5ecqg1yOAOcrpvsfUEPFq4GNxJmmbiZd3+V5cw5BS4Mz90snYouTjGeNBfQ0VQPJy8nrGjBwD5z9NWUtU3ndU9XWF1iVkIHLeWOE+ioIRQDGE0CxWKq1p6QRmbxsJ4z+DQAmRaSXqsTTJ72vqQamI1bvTH8+R9Q5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCLGc7LE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTRoSeJF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLGc7LE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTRoSeJF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AjA2275885
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=; b=lCLGc7LEXCK1uWmy
	HqD22Xn8MbL46m3I/dpxvDbRB5HvJCdFaakmKxBNvvbk7Tr/JLiiJla6qspz6dKp
	J00cCffHC1/UCAD9YdKlYfRNb1Zsv1bSa//q0j5sC4XMvEtxvD9bDKXUfURllH67
	aZXh4l6uozsQLmERXkHOotpweC4KOH0juzD4/NaDnYmBeY3TgTc743MHBO2w55Zj
	jcEjv60L4WNiCZQwoDhtKxZzD+O6c5dlLkN9SaD/CEo03QCJ5tCiDez59F9Zdj7o
	xPuHBMkNbFe94VLixcLPY4HoxlFXQuPbNcJSeoa3tq35X8Hnio41owm7yGHVm4Fq
	6GpZRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1hv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so4325131eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811976; x=1792416776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=;
        b=dTRoSeJFPiDZ1ZU2BZu7uOngfENaJ54VtHX7yKns5BqJ/HIozDD49Kqup9cj4aH4qY
         JHlnoeqONDUL6gQbU6+QkrZya+lqh1gyP+HEvwizYMSS5wMZ0ZwQ3akYQkhbTL1xOvGQ
         iuCoSRvfL021hiRDtn8AttT0inHHT3BzB/dE6OptHQipZyW9liCx8aqbCqXBhHAjBPGh
         HwLOZMMRKmAyrRAkdIVBgmB//6aeb5XsXCMS3eeixn5Ce5bQm0OdOM4P3z+6Di439V14
         V+Oq8sGjzZ1midMg8iuSsZ6o1lDY7bfVEcElX8u7Xo6gt4cJOMfVifs2rIF2/oabygMJ
         N0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811976; x=1792416776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1IjNtEMdxjbwDwuNpcU6wRXEZzlvZfdEKgYGqTYRAI=;
        b=fsBByh3W3SAmkykQa/l+CO3KlEBd6PXuhn81c6X0J1iofh0SvePd5ci5vQqW1tx7ov
         ba6zm24axqh4ejyFeOZA/e9pzyz0lVwWpYB8CC0QLriI27QKt/yqhL+ufZy0Wcb/x1jL
         sJFyDQFT4lLEeEK8fkqjbCmqMCFi4DuIqxTv67/PPSeA5kVlNAuFYjJx559OX4rpztRE
         wwxQ6FshAt6aYnkmRBpxHBAlUleA5+Y5az27udjQy62HW1JfAnflxwRCS72RSfwSx9T/
         Ilgl9O7c0l98w4T9qhgL2qfSDcvShU1DqXVB7Kz7XHV2zrVryau8d8l3Pdoz5UhTjxFE
         qSgw==
X-Forwarded-Encrypted: i=1; AKwUvBwwU5PKl07Ku3ang1pFKo9hBCSWZPKeS+EC+V0tX7wPYXpgDSCX440wQq+jxjrXQoPU+R++APkb1zoA@vger.kernel.org
X-Gm-Message-State: AFq9FYIg7ruYT0h4vcpaCam6+UlM/yHyVtguasJG64bV23jH29sFPQR+
	UDmwttXGo8gi/eEf9KrCfXyL/6H+dtOmWmZaoIbx8+q32g2T1SO0ygDPFWYYWZcUrcbAV62LCC7
	jUbXlALSDp3cTT78cPxdKfldmRBYQRDUZOSoM+u2kT5NLBCpo8md7NcsYmD4rCUWj
X-Gm-Gg: AYBFou0YjrMixjXPIOiDB2JCoIMW2Hw3nIEDa/DZrQMgqXWZAe1PTLof2eEVCLH0fH4
	k8VS1dWVOWP7Cp38K4+1PsLXSYK54cz78bz94zLQMHPXp3qLRJh7EbzT9rtlnY3CDwO1h9AYDUV
	UQARLndhI0JTw2bulXOeosiXwRIlJSaRIxHCcbPuYihpV6Nk//zPgESDFSHbZo5gVXWot2qyz9M
	9F/xW66Aco+e3xZOcVekmJm7BfNA7xJsyptwkniKy0WLzG3drt7mq6xkiHFXSvg6imcs2fwYq62
	E8xoEshW0l7kIGtP3JcE5H26lt6lyUr77AL9/JhT5K+1FtCpBpauK9LmZ2lAibQyFFU/z1UEmMP
	6Yw+1VaFGDp/YtE+cQiZgyeHj0es=
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr18413037eec.12.1791811975583;
        Mon, 12 Oct 2026 06:32:55 -0700 (PDT)
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr18412982eec.12.1791811975006;
        Mon, 12 Oct 2026 06:32:55 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:12 +0530
Subject: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1467;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=mVpP8pxnU4255kU6h5VkhP1R63UQvGKZmNqAt9hXj2M=;
 b=LD0OMDaEEh2++O5ZlIhqQ2YfyYZKek2XbkJiqhtEHPi/CUYUHDtQ7ubnfsfN0NDscNI8kyXgQ
 Jjt14Bp7vrdAvUiKq6B30/SPLabJoaJNgxD1DOioHI1kDI/usPzIZNT
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acce188 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JUH7OfOS-bFBGMyep_YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX31rpUwh/3Bc7
 /tpoLqOKoDg0xcItg4+ysiTDBNKoSPx5lVCsscDrdJ1x526/A/5/BilFp18NgfRFW7l3qUK1uay
 teIzF85eLrmpx1GrKnbi5hQzpzxPKPI=
X-Proofpoint-GUID: R_pkSmoRADb8rQ2FUM79kAVbs2K_VgzK
X-Proofpoint-ORIG-GUID: R_pkSmoRADb8rQ2FUM79kAVbs2K_VgzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX19gFd2qCmyD5
 Or5asqE19ElIc/c9CQAEWxum2ygU9Hsvyf+CwfEm4FOu00Iy6C482r19MpE1xV0/MsvenBbSCQn
 lEsqSLqLcogNeOhQdnOdrB4uFUhQ0R4Z1KY9DVBx0NW9lZS/uwUr+k+2txcqoylM7jaHsSvJRg2
 RKFSFvHWnrfZWXD+17UrHSBW52336B4SCLEsINFPTlqGKmgSYxpuSJY/kEHUSuUmyGiCRDD9PrR
 OPmjCSUTrdKuDqJB2VtBVHsYpTk2FfzxSJyeGy3n0N5e5gKHYdBmbcWFJ0nseqOdzfYvHXak2nP
 WJWofrxiCSS9ymYdNgcMMlHssMLEROZKUpU5E5Q6P8f762GvMYTC3W5Jygg/684UoAYxqZZmB8W
 02pRT+/uPHMc1ZfKgNRQKKBWh5RSCFcyAwEVuKawE9TdC1A01T0msLL0B3uDoim2Aa/Z593vNrY
 JHUUm1nIZqXP24AJGJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord uses MDSS 12.1 with two independent DP controller instances,
each exposing two DP cores at new IO offsets. None of the existing
compatibles match this layout, so add qcom,nord-dp.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..fce8b962a6b8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,nord-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -209,6 +210,7 @@ allOf:
             contains:
               enum:
                 - qcom,glymur-dp
+                - qcom,nord-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -315,6 +317,7 @@ allOf:
             enum:
               # these platforms support 4 stream MST on first DP,
               # 2 streams MST on the second one.
+              - qcom,nord-dp
               - qcom,sa8775p-dp
     then:
       properties:

-- 
2.34.1

