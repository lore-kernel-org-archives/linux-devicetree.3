Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941DA3CE4B5
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330737; cv=none; b=CaODScbRKc1eSGtLeuAMSfmP89RLEl0bUElQYZmynTM0opiAkCgPuxrE71c1vCuFtYI25SocP0TyT/ql+drTu+GAGe5ZeBzuVLCTQJeoPgxhniuQH/jZIXWV6lBOriAQH+fyNtXULaARBOqFwLvjShVX/ssIlFMmQnIjNB6ozYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330737; c=relaxed/simple;
	bh=0hivd+NbwcO3jYkg4nrQUymtlVO3eRTGvyxQRmrq9cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8rGTvtV4QRpaoaXnxNaMLi4kJOKfAuYlhtB1O0Ajf+M6qdNuCCr3m+FLQM4zTprL2ArDblVFaxvTek/UuaQCAKZ2sbRdiUh61ECmGMs1BbOlitHDff2ZEJGYPOCeQuvxc7bXwO382dhVlswjjzATS5c8ZG6atoEB46psTYWA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m91w9Nph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV7999Hp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m91w9Nph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV7999Hp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxYg82848775
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNaJ6hYn/3P
	1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=; b=m91w9Nphu6CWLLEqAiNoxLRVtrB
	sxVozXqqT0M7UeyyO2naBT7sqD537Fm44KYZ6emfOpMDkheushHlq0IbVRwjuhn5
	/8Xf8nerCamb9Z1yCHUpr8J9fAiuPWN1E5vO/wWh6VZVP/XZwDTWbYjEcgDrg+4C
	54HflQmoperShDR5sLnr0+Dqia3Z2/fhfZSzQSXDJh1Ou2igFOTlhZJsxI9n2sF9
	MuQ4hw7mn9WcpT75OG2q0/O5xJRCR2465rFFYGBhT7Ctm9fp5I+0BLSjNgx8uzI5
	acMKO1bwdP+3n6RaBzcQxqHnJs3P01nI4BDGLo61h8ENxwQrGL4kG9PzTzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc1w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so684947285a.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330733; x=1789935533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=iV7999HpWCJjPyOceY0tME3lZ9Sw6QvN3eemlkk7KxH5JdmUSMHvwQ8L4oHY+zNGqN
         KJbxjFHKzBqy47V6Bjjs8DDkEj89ieIMduveP5Uvzi9BuZOtqLBwGqXhxi219wtgNBU7
         iPnx6e+jNpe19ia3XKxY3Q7ElyQpYwwpBgFyzIljfxqKRxe7JNc9JQVMXlNHOPP8a0wT
         caMRSb4JTtyRv6Ld5UZft/s/3YX6xdJ3fBuXpx6JvjCEdGv4O8bCZie+hKXfTx5lGzwV
         Da8WeKU8cZ7oSKeCoRIn1XtOt2/Oe7WUqSmwGqRNlibEfLaNGWxYf1At3yb/SoHsyo3U
         OLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330733; x=1789935533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNaJ6hYn/3P1WJfHMhnLB63NIsjWFWZxk8ABxRe5jpw=;
        b=FST/82Jk22//OsX6vr09acIRxVyOJQxJyrhZz7CidbCwuBI4x+ELohxSOxmwNaDRnF
         roUl5KHV2azCkdpaIyDJWGJU0VNPOYF6jzi8Ki6jguQ7Xr4hJtGs6zEa/iaG0hb54ynM
         iFPXYc4LodTEB+8C+ckswC7Zl/0od+K1pT/z7p0dWkMVoeSGFQatYtaiBYs3iDfHh1vc
         sSr3poxkK/5sj4tJ9RZ5F1rQ8BLsXhc+IkUqC77WTvS5PiClVHIun3kMEcpXYv/vYElN
         xRr6Vij2MhZh/Sg1frR0mOLRNxSDXEa9BcsoLULw081vgTcZedINHS8ZK03/eJBkEs+8
         hBYw==
X-Forwarded-Encrypted: i=1; AKwUvByM37l/8OYSMhO8nhwtkaWuRtYAEetfeH70Vpdpp9BWHuOGQJNR8z/itMFUX+3JtQSSax4dmyxpao6E@vger.kernel.org
X-Gm-Message-State: AFuF++nlJ7CdOgFPhvhHuKKHGDO4scexkgQurzeiHFeOIadNz9VeZ0FI
	vbyxc4FhRfyBHcBlkIHOdDTxbUg+VuLisd/iAnbzGoiV5ylIYU/JsoQLmvbj8gMBOYc9JXK4HhB
	P1lrt3TAo/0dC2q2FF8uRIwmcJ94kzFMB7mXuHHodPNZpmvJHi4blJ396P4VnDird
X-Gm-Gg: AYBFou18tWS02GeKSdqN69OzQiLcnuNXaSDdaXm67nH1UaWmTzGPCOtS/NutqLMp6Ud
	y4FtS+TS4c4LcVKhU3YL8PTqwN6EqltO0RWkIHVMHHpVVtv6S9c2W7RhWtUYi92hX6eMS12ZkPq
	V7DpK6rgeavxul3lQfbKX8YB76hwMKAdPjnma75nXMbJ2eQdjHnCAeHK3jMWZNog4UpQ2fyY+43
	ce6MfItmdJCiYK/+j6YvEJj83s0XHEBZ8xPwrlPZP32XnTiii2UtHT8UjEv1jGN+SMEQt4+Toud
	ZPrgV9g0txgebjbFZbw83jl+PcG4EEbDtku/5qy+QvAoLx4McOtGM2hlEPg/1FdfOt7U+PgyXB1
	5/qdPR0qcioe1sQ==
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125867785a.46.1789330733365;
        Sun, 13 Sep 2026 13:18:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a03939ffbmr1125862285a.46.1789330732863;
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:35 +0100
Message-ID: <20260913201835.250085-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa7052d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX4Rlel8OZxRyA
 GNhwMPi+KD8aCoo8W8IK3OaWYccKHYHr7CWUPl/Mr6hS7/nNoUCETXLSfWl65+6csiLm7WPMdBD
 gRYcTE2ojFbRi6agsJDEn7UkMsq060U=
X-Proofpoint-ORIG-GUID: FWx3s8X8VgkwyaHCCQfk1-nwCVBJuUOJ
X-Proofpoint-GUID: FWx3s8X8VgkwyaHCCQfk1-nwCVBJuUOJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX0camT61J4amF
 DevG6+8u72dMKrnI+oxeqTQwoBlIOZTzLZL7EVYQBHiZOKpZjcyzM6NSUKARE0KQROAe2MwdRMk
 o6tKkIhRo+xsiOywG7wLSeiwWP9KHoX+7MuE60RGnUjQ/GMFrF1RwHGS4Zhzo3oIJS6+p+LAOub
 fGX76K+8VmXk7PwtSDyc746LJbNbQIPR9GexRj1xlpQ+d4koEsGGoHImmGl/T6a38GNpcnZORwq
 aNl6ipAjD6pcHMx2GwRzhsS2hpmEx+Opb6U50aZK4r+h8aChD0ci5UMgKsVSDJhzyW2OR6h0NHd
 OGErzYBM0G4wqBqHSK+ZOjoP9zaxzu7WlyXwWUG488OnKpVDvSr7pFDxOJr/Iu5Bfd8upHiRPKp
 fmtxnxZDBb0IeQj2kEw/5aS7p6QxreFhVbslupYLaFtaDXURIOsbCiR8qYAUk3AoV63KazkAbqS
 dLoHD04PhSsqNlyD8oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..aecb22bb9662 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2233,6 +2233,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "medion,sprchrgd14s1" },
-- 
2.53.0

