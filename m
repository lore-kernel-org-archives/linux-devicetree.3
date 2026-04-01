Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A68384257
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028430; cv=none; b=Q44lNMQPyVHdte9+T4nmbQAKG4cOctf0l2UReCpo7i0RSFT31MnvdrvGDVUgemGET1vVCklCd9XZYxsSFsCAjLgtLO8ghwlRFdaXShEJawonsly0T1/DY9bP6W0716aLuF4mzQCfGWPTXDEdawWxx5ssmRK8S0gVGNoFCPUoV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028430; c=relaxed/simple;
	bh=Jb08fm0uAjy2z0dtmhiX4xlViALafz8SI/Bl5/q0t+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghtNRpjdW9u3NGdVf7KDFaK4S9e2jPuaWBDd6ofKBGxPM4v988rvVrkumCYCspQqOUOI8xe99fLw/B4Ikzs8y4dBkdwkc73PJ1xv5xreD0NT74P7HQwApdT8b9lPXCRC4C2F2uygw5kbPH2Oggme6CXKTtQOR7DHhoEhCokL0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ib2/N/vI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TylwJDIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ib2/N/vI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TylwJDIf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317CcbQ3103857
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=; b=Ib2/N/vICySJHft6
	DPp4OLoOVWXGFAjYxdeQLs/Q1/n2rDeknq0CC8uM6e5TB0ExEPuPK6YDrg7NHO7w
	EtYPnN+Emkpw7tmSCXR2tlv1eLGYIzFYC4fXoOU5vy93A8+6TuZVAzspLyhU7P2S
	hKxevVoGyPnDI94N5y3pT+b5rSSgvhJh0AY9rdmrsru41lWZpTIIDKNwjLxNr+jD
	q+EWiRMP3XazH0zAOsIGmSn5AcnROBmTUCakdwh1q19FZjKLzjPDQI1Zj/+mvObI
	nLsff0vnNDqMRSJHcu1LmueUNyfiRCuO6Du+Petpgko1xwWLhMXP9Buqzelzd+ty
	QbM9xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js233h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:27:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so18615751cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028427; x=1775633227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=;
        b=TylwJDIfQw4hrNInlKUvRMrXxPhBx2YaRDl4QxdejFgmC79/RVbCRSZRJP/vPD/l4g
         Q8Wk/4wyMTebjxtWV4cGeN0mXc9pb60rnVgEzE4yx1u7PaFi8XCl7KIEHaTBtSdlQSqv
         K8J6o5xQZGrEUu0NFvKvMQJfpO9EnuWoxive185/Bwtuw3w9UTgkv8bgp5IVz291279O
         2iU7NI88a/jZA3vOLAEOhqJhzdolTiDmFzEDv9tsF3ZtbNm70zFhpAetQ+I2r0G4GhjF
         LDJA/dBa3btSoeu8bbGHicKORgZLXv55MP+xfdSfL5T5c10gf8RBTDgGMsX85WM6o3JK
         tpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028427; x=1775633227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jXKe+OsCdQHPE3k51l74ZUAGKqzcezMcZ3x+/awxYVE=;
        b=A3lSLl9VmoGQT4zz9OCrT/6F1GALU8NbgHi05R89MnRwxy6uEeJRTrX0Ia0K1UvtV5
         t5csU94SSuCmmcgKoAbAb4xhog7RWVIzXCuOdr05pQp28hxTSQXZ7Kt3nmXrMI85Plrx
         oCtJn+3kG/HBmXQph4VmTUkwYJGUxFKLxU0IQ4PMGueAwrS7l7L44nBYeVpOpQ0STDlJ
         M/YXqlbevPFF2yZklgrwp2fSZ1OMS3z3G+6lwMWd2G1L5hClAxOJABxzf6Y5mUQBWtXD
         HCVmmmnrTAA4vJfKNXoA9AeLt+drvX77zHm4ZGkahaQjhyjzezXtcUoWGuD/sqsmOP/i
         wcUA==
X-Forwarded-Encrypted: i=1; AJvYcCVE1CWNpVDx46+U1APq2wcQRiR91VkVYN6wn5zG1mPFgVfncvjzm7uEEsaqkLuNjrY0Wt4/g+xVRgLD@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJtL+Gvq0maUBRoJvHHQWPH4rcpkROS0ix8csHH6xzESH8LZp
	KhpDhSbeyGSiq+NEhK3FrE36JgYlPkwuWoHP8+hrKu1O0Y+qiwBUpEJ5vaLTx49HIC1gceDbkWV
	OsaUdpkAJwPbNPg/p6jdqRlacDhwE1UuIyPN1mfq2M1hYrrJ1v+M8aENVvJPp+Ee7
X-Gm-Gg: ATEYQzzoIDVB2j27lq0SlNaQt3Xad/hdCw2m5yBCenBYQGzsN3FysUNeAajGD5Pvux3
	0yktmaNvgJu8R9OsXkg9FlZIBWoZEj3WyAvw2KN2+W6fzC0qb7M/gYhQ//t5/UGMoCDozMKeklE
	gbI4Go4BvGWv5XpYdAsO9r+djtdtuyfi4dG+EmaENIM5wlau+Ih0yUYzZZta+Wg0pfFvDj1VRBt
	0WRT8+aiWb/RjdzUrzFVfEkM3Tlb05xrQsVEHSkKBqY+xY3Z7GMV1exIHFXlTPegC2g3hZAWGgO
	AxlJvqV7vzEmyP9kh5huUcDoL+QdHycU8jC34pdF3tciuFNBmc85XD8ZkENFuVZpRmyNuPlkpef
	/KUT2rl2/kwlvX293Xn3lFZC3FjGFN+pczJafeDt7/t7dqCIQYDo5PJw6d4SRDuJYorKhtvIW1d
	k6gGF34hYEEpxYLjqgRM2Y6JZGHsv8zcznA0Y=
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr62318841cf.3.1775028427593;
        Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr62318551cf.3.1775028427210;
        Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:32 +0300
Subject: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set
 prepare_prev_first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jb08fm0uAjy2z0dtmhiX4xlViALafz8SI/Bl5/q0t+Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aZE2v3XClYbuEo9EL3Uo3ljZ9ilmsXctuum+ySvvOWt
 3t3drhAJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8oeB/Q9/5TS9k4oHQ30M
 0x9lH5nk0sioV1018Zy9Z8YaaYaHLPNcmxlW9Nmcf9TZe7MoLOWoWp6Ewp/MFQahfax/rxcJKba
 ccDNx7V7McCEtymDZ937RqJ/V0/SFP178kcrCtjjj7BQu3cZHPHlB68/9TtSXZgtYbLKgylFbrW
 rVnh3NxrV8vK77J115zL7+Y6Pep11WLkwzI4MzL0px9bekC283++tzYItDduiTPv7vu5KYzpWmv
 1pr/mzdPl99thK2lC/tuTJP7hd7PduYWuTHm8MoXFdVpbK2i9Fg3Z7wgB9KL2ROOmcFzdhfaxJ3
 Y+e6DUaWv6K9mTpF69gDY37euvzq8Z+zmfEWrVX8U8sA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Cy8kngIrBWzKCLxbDMXoJ-Q5hsQTmM87
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccc8cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cd2vOsepvhAVWqutC0UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX4qvaFv0U1vY9
 bpU2qsiqNUfxnTJTdWhnDJULZt/3C2DHrLNZFQX0N4Gleb3H20QM0w18yFS/MRsmJ0R5DxWOXq3
 NJ30z3ejfP+ahhxSx2DE1IVl1x/6YUTAmuo1zbrQhq3MbW5o3VF18R6V3rgBrUEFqBt6W7H2sbk
 S1c9OQPUNbyd3n91V8cwh2tkESLZARceCrOj0ptDk5/i9hYCo8CiDMtcFBnV0mLWMIOqAEYu/3z
 Vr6kmjLI/GFF+rXtQNOujYwuRZ9W25gAY1pSdb1hGltK6Z5GBR115ADZAD1lehYS2RK3NCzd2ys
 58tX5KO4BC/zrP0CPC4XzhOwNC0BmPvMFkKs93u+klC03BTAyXvXicob7/0TG3RQm+mFro1kCSL
 odtY3oDuKPAhQYr1Dp3N2+RTHVHQpS6Lm/N9Oktz1BrzSRRbln6SE0YFvQC+KzZ3WyRSxmvTpJq
 ffCkhbvAlA0cEeEdEwg==
X-Proofpoint-GUID: Cy8kngIrBWzKCLxbDMXoJ-Q5hsQTmM87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5d9db2e1f28f..11b7e07c1af8 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1652,6 +1652,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	jadard->panel.prepare_prev_first = true;
+
 	drm_panel_add(&jadard->panel);
 
 	mipi_dsi_set_drvdata(dsi, jadard);

-- 
2.47.3

