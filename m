Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655909;
	b=lMvbbgh4SxDnYb5u+6zbl9eLPPHJ/lE/umcb1dFLCGsdr/8hrcyo5RR8B0NESx8gTTNz
	 L1unU9v0bxAen1QslEsYi4FJuEMgCjn/hLj4V30LsQ4iNY3I+S7D/84mkki3wnXARahhZ
	 0skXHoRHnejIAeRlYEnRNOKY+WCFAjnZbCgXCkXBtwCbbnGwoNkhM+LlZUyO9fyD+RpSD
	 PiChwuijWBsMb5tbamnqztE6bczpCXepumYC8hdN8SVjkInq3aoPX6Xi2/0IC0iGJQuUI
	 mOSb7ow+yU/xkKIAkI3rVdGZaETq5WEdTvmuSRlES9vE9/GLaoAckSrIi/yUK8lEIiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
	b=ITK/OzdAfsPvGA3gOQS+5eZPgZTQS5rzg3mSazTjPTKC3K31cn6FXIYS+FLALp8BPJ4N
	 ErajtZ8P3sZ/V/x5h7Pgj4dRfPAck7XNwVUC4oGlBZP1aQq0IdsYHHACuCzQ3LFYbK8VK
	 +sCwyVdPFvKdNXXRt4wB8d1JOCw1CHfwB6sPNV8+cg1pdFGpS4xF3LhKFtwn2rQzg8UrW
	 +MmkPwmyMKeM6sMkfFoqQuPE+Jrbf0ToNj+xNu9DVGL/wl036eUM4FsiZnmANihyGGjRW
	 CQAa+FDBzaRm1DU0COulzcD37dKCtmB2gVg+vVOgYbsDKrP7ENQ37CdmB2RPPWjWt6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioivrY6L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhaghYD0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A7606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139A7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ioivrY6L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhaghYD0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w8ma3844415
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=; b=ioivrY6L5LVUM5Gs
	kZGmM45sTcU6CRkqLf/EW7hft8Z1+cRa06wrCnUCbyKlYtyRLb2g16yJ1zY6Ws3N
	HzLJTcfsKAY/l8hzlI/o16ClZeSUfjxemgkjE5JMaNy17k17Qc7r1uQY1PLQFNbu
	38FSjnZsEm3btj3ad9OxH741dIwfShVKdIa9uR3GxkmmxXbFWAU9uU3a5hziZvXI
	3TM1R/LoXzj5AjiB+6+iZ0ZGsA1fY1fxiiKux6sW26XND9s9mKyGh50B3EO771yQ
	rhSF5nQbSmWrUZYtwJmiAzZKynFfmmqd4KgAaGvKINsx1A00Z9LnzCGGyTuBR3w7
	f53aCg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgn6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:31:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f03ea17f4so42178426d6.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655907; x=1795260707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
        b=HhaghYD0p3nzup7vOE+i5QoHaAPb7+fdNPJH1aPdUJTtdhtrOHQk27QdszqkbBlQu7
         EDMT5i5Dq93GqtDEkdj/2yVmklcweo5unZSk23INWasX6qHLsRThclRXdyKYUWN3VfpO
         zPxZeQL7ulF6MQxYilNmmg+3sJfoMDxbT6DPMu5AQ0j+s77XKC01OeK/hiTSHtRjTxih
         K2v1AjfyivjQLbqaPI87cJ6Vp3F1uXKZVCo8k33O+V7bGocki3dUJyhiJmHtBQqaC/wJ
         ardf5oUEK08rbFrbB60gNk1rVC+JiFOfxRL1AzH/IgM7uaxUQ7E6sz60N5ZrI7OOr71v
         tvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655907; x=1795260707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fq0eSwayBFJV2y635upNqo1ZfKf4GK2LSEcREJOfams=;
        b=rFZqMW510KkWFuCYqqNGUP5AnvgeNvLemkMCwfkVTLxx5/dRR2MgLEcC7vwk1PEjXf
         dX7a0IF/uTSve0CSo/o5dsNE/3ecKkCcOGCsPDAmpHs0zlsgK9BMEl2/22gaoVR8cUNp
         xJKeElznz9xgZuwItok3xODPoDYatmGOhJ0NI8SKCP/tA03FxCOSvH8xgB7rzL4LtvyC
         B75PMXbqTQlMzFI7boIn0Zf+/pDYlDAV9D6+vOExenXF1oGaNMgyCiPhyu4taBrDZsBJ
         OsGjAmDSLWQ97d0YDwbh8nXvMQsuYeVZtui+Eif2OnS3KznZsmEnOpJQwe1vdKSqWTZy
         26AQ==
X-Forwarded-Encrypted: i=1; AL+hErF0kZDClFlC8uTUx2dEM1FcWgYjhCBas/jBU/jH88Gcs7yraxKLIm2ITv4Z5Oycn/TPFKVqn/KZvmc2@vger.kernel.org
X-Gm-Message-State: APuU4Z+s+3J1kfL6/Ge8DGS4MhR8PeVDI5X4fR4WZ/I8sU4ihNtqX7wT
	76ZFebPPli5SQwW+OO+sy4bsi4UFPUayF5p3G8i3f3aoA+NgdBFLaDBqWtDUNMCMbR3Ts+gXgZv
	ySHSEvUpbUrXMpyywUepF/22B8XS7R7lHoxLGCkmfvCObHGteI96ZeGeP6c7pToSVVulQXTEu2q
	g=
X-Gm-Gg: AYBFou0CqTFqhiNWDj8pFicsguSn8E9HuxS4viEqXw8XVjEtDB60zDMTE56dqq8nMCB
	jl2C6Sdqrpwv5P67m0jgHp1uFYt/PyC1oNwoBU5jzlMHtIzKlBKZAMpFLcOzfcjS95EEx3v0JPB
	8uFRqpB2Yh3GADeMxIQc39OXFwfBJ9qfZyZJXVmARb2mX8ItYd84wMh9suQOq1UHOAC7xzUKkmb
	gxwimjZ3qGOpVEiOZyikjTR+SO/wgBz8zB8s5r31l7UxNzZrDLpgVdMkFzrigSHlC32zIpAZBWe
	WAa21yjbTeCza6hqypp3LmrObfeuGIdkbFMN2aFzZOIkkBzJCPSD7uk5gwmYBABdbPigRg9WaMr
	d98xYaDDIkPnbYJdfP9o/vaIpNWUw8oUkovqAffXkKWCwXW1LdEyB72h5bMMQh4Ffp079ydrO4O
	HFK0VN1GJNx20MXq26g8ZOYx96ebb/EfM/Zciiovwe
X-Received: by 2002:a05:6214:c8d:b0:91f:3204:f150 with SMTP id 6a1803df08f44-91f3204f27dmr40312786d6.48.1794655907378;
        Sat, 14 Nov 2026 03:31:47 -0800 (PST)
X-Received: by 2002:a05:6214:c8d:b0:91f:3204:f150 with SMTP id 6a1803df08f44-91f3204f27dmr40312426d6.48.1794655906915;
        Sat, 14 Nov 2026 03:31:46 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:31:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:30 +0800
Subject: [PATCH v7 13/23] media: qcom: camss: Add Eliza compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-13-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=4231;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=MGcvrm40G1MvJFbNKYdvpmfRzh1tNKV72j31vx5Ra34=;
 b=I0BIVZb/mptxCXOKqa2wQH4o4PnpereymYjEMuJVi02OM4IRfEkK1BFjhxX5F2gObDKBnCE1k
 0HF70lOK+vyCS3GE59fAVtuJjSlr/9iLOaCfpt6WAOlEOMMMuHOPuZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: gaJOdMD-emfsK1D15QBLG7K7cnclJnHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyZdF0MUo9CNz
 A5barob51LphoxAujkOuhQd6Mr9z+Kas8N2NTIuPmSMnghslOZC8iUJByyDb1pVJKeOEZAcuDZW
 aIUH++fQqXf9Au10no4WWmfhho1i1E4x5sMrjP+e7iLJsk0q2y8Y6mxvGX87veIsoSBeg8poVgC
 7UmbxdsO7Tx/kqZcPJKwMbV071/3/s0iwdYBcj8k8jBartZcBYGgC4C2QMh/2leHCKa+02UVzin
 Qbi2rGISf3okUcTgzzTzEOgN8OygujP+Jol/uDyGzb/DfgnfulhuelrSkoXu8Zl3ZzdXLSD5wZp
 LeEmGG+yrlWUji+G9HucbUk8Q+3m1++nscJgCCPKGQjE3r5hU2osF82vyFN0Rxefka+loMqf7Qq
 MyA7gjrNA6m6GnBvwFmSwuQ4QjPatTO42RwyJlSktbiYcghAzd7m/abzxctdPSVuSQvruR+eNu0
 OOx5ov4aAMMGcMj70PA==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af846a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-cpAvnqLVGaxAupx5UIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: gaJOdMD-emfsK1D15QBLG7K7cnclJnHW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX1ip2P8QBQhbd
 jXpAJglbjrCZbsgbUbx6X1p5feGTEMTB0AXdcCVS0YDvozGk4/r4E1KAq1geg3YoL1EL1SWKQiB
 YiBTV0fUyFeMo5qKi/HJzd2/LOaNY2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add CAMSS_ELIZA enum, Eliza compatible and Eliza CAMSS driver private
data. Eliza has 3 CSID + 1 CSID Lite, 3 VFE + 1 VFE Lite and 2 TPG
instances. CSIPHY resources are not listed because the PHYs are probed
standalone.

Eliza's CSID 970 and VFE 970 are register compatible with the SM8750
CSID 980 and VFE 980, so reuse the SM8750 CSID, VFE and TPG resources.
The only difference is that the VFE RDI write master client IDs start at
20 instead of 23.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-980.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  2 ++
 drivers/media/platform/qcom/camss/camss.c         | 16 ++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h         |  1 +
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-980.c b/drivers/media/platform/qcom/camss/camss-vfe-980.c
index 47f6c18190acfbf3c6ab49186fc73fde6a0ac799..ecdfaa4d528aaacd97aae6335c6488de09cf6e12 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-980.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-980.c
@@ -83,8 +83,11 @@
  * RDI3			3
  * GAMMA		4
  * STATES_BE		5
+ *
+ * On Eliza (VFE 970) the RDI0..3 write master client IDs are 20..23.
  */
-#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+#define RDI_WM_BASE(vfe)	((vfe)->camss->res->version == CAMSS_ELIZA ? 0x14 : 0x17)
+#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : RDI_WM_BASE(vfe)) + (n))
 
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 7a20d9c1a350da183959f9ae024ef6f53cbd0c1c..3992516d672ebd43184c2a82e238581bf693cbe2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8650:
 	case CAMSS_8750:
 	case CAMSS_8775P:
+	case CAMSS_ELIZA:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -2020,6 +2021,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8650:
 	case CAMSS_8750:
 	case CAMSS_8775P:
+	case CAMSS_ELIZA:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index de22ff74c7acfe912afea31dabc1ecc250b022b0..a6a0313eeabca5f2c8f8c7b569030ea5b0a5a848 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6238,6 +6238,21 @@ static const struct camss_resources sm8750_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8750),
 };
 
+static const struct camss_resources eliza_resources = {
+	.version = CAMSS_ELIZA,
+	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csid_res = csid_res_sm8750,
+	.vfe_res = vfe_res_sm8750,
+	.icc_res = icc_res_sm8750,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+	.csiphy_num = 4,
+	.tpg_num = 2,
+	.csid_num = 4,
+	.vfe_num = 4,
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6255,6 +6270,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,eliza-camss", .data = &eliza_resources },
 	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3da970d251e728d339d13fdaef23ea5dfa46dd3b..0f909a4a409b7d1476966aecfaebb4cd60871974 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ enum camss_version {
 	CAMSS_8650,
 	CAMSS_8750,
 	CAMSS_8775P,
+	CAMSS_ELIZA,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };

-- 
2.34.1

