Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B342E7361
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322105; cv=none; b=LBsu4nB5nlFTS/aICS5KURFjkAAwqca8RF1YVTTLiQdm+TokOHfR54fnOMK+t+biMwUKfH3aewCWCu27c6bzH9QAhu7BNTo59Z+js+UXPg45rM8c/0WQcfYQzFmx9Bqu3nMSMqCAo3+iJuTF9YVTefFUwtMJfCXLYZLSYfFjws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322105; c=relaxed/simple;
	bh=wTlcJjr/7GjgN5KOZqVi53TFOXlRdDit+q3353+5ecY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgsJdINOqhr2V2w9CVNjwmPzSp+C0C6euMw2BOv/SZFrbD8E2PPpqn4TugqQgz8BHEOckDM04ZBKNJusXy0eXO70j0Wmvn+mWJvqhyK/1DWcM+HvTlk0Ix1WD3DnWkQw9sEubAGfAES6+HO2QMfRoq2DQOAGDFibzd1ecGcOFFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kF80PUxc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTU9w6dl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kF80PUxc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTU9w6dl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641U4R3593754
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=82mBqArgTxyLpmRMxkuTRwvvzBiaw8vr/Nq
	TQDkeK2M=; b=kF80PUxcfFl2uyGUjpZINGGCLMx/k56v4FqfRTcDW6edmDyhGWc
	D8EtAnsII3x9aRynm/R1+epCBC+hqFwXsq/FXigYxJkNPmNBIlKyyOP/xj5OnMbD
	eCBluOh4lnCueBuFzBNtNuAx9sVrDcRGAK1pdGuN+t7ccmyjmKFOGuBzfMhkwOL4
	QVPIjOYTDfRjNG9K2koAY4N7thwuo9ZHjBCy2qI8NRu9v19gTw8mBwfJwDnFQwON
	a+Sm0GCQ+HAkv0350sBpoNhcDHAxH9s4wLEdYIZTP9fqfJ1UxFuOX0H1CnxGy7uZ
	FRM4mjcm0XXNylNZbKTa/CVRzUIufh3Tj9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh53e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so266935885a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783322092; x=1783926892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82mBqArgTxyLpmRMxkuTRwvvzBiaw8vr/NqTQDkeK2M=;
        b=hTU9w6dlMDN+pNQ9cBgTK5TS2glA7fO+41+lSvRG8sPvxAgS4eMGaHTWi4+fTUJ0Zi
         4YiJWqjnxenpTaK0MupPjzMLzJdqbWJ+D0rcZdD/vOqhy9vBMDzwCsPNdH87N3opmi/g
         gIM6uzzGzUlMAZQoKD0u6O811sxV/Fqo2UOgH7QHKh6gMWb8ZZlB6sDPps6FeJwXucAs
         THIyY2Ke94ddq+RfRpSQ/3agKwyQfa+Egt5VptZV1wtxyi5eTvlYhVGV7uIYGbHMAe7W
         lcaQx5z2OUN+L3IBfBuZWK5/FHqp9WY0pm/f4BdTJCB5Vnsnc7Ka28vinUTlpqHKeJ/y
         hwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322092; x=1783926892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82mBqArgTxyLpmRMxkuTRwvvzBiaw8vr/NqTQDkeK2M=;
        b=E2sT6iZq51A8xPvMrFU2poV8O5dzehZio1w0zrOxRzBPDsemUbz2rvCeD2iyD+nVlb
         rV3VU/EaX0qXIYigzqfM4RKq9Q58qGJnNByHx6LW0x4GW/chjoNRwIjsZrmnwZpJuTMe
         A0vveJG3RMd6ev7m/dsJfQApMQxeDAm07KKqevYTRMvHAmppFJkeeegXklKpoEPm6Cw1
         L6JUvT4Om21bX882n3kW68uPVNq5wVNC0Um9bJEzrjg3wEHT5O/HTQXFHsLgdyMXPgAu
         KbDJGZR7WvjnnLqWjscaKZrGX78SkSxXxsSZ9gaiK+BMlw07V+VFhezLEAc2QNEuQVCz
         U91Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro172fBh5ny/VbpX6Qoy0QoV1HUDClGu2vsZe1nzkZgNf4LBidRIZkkE2EB0qCPqx5gMmssjdk3dWVM@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBRIGb211EOVTdzM4VQ+7S6KLWa1lPB5WPvSSHdni1mFjQ6Mf
	/Y+NqCh2sZtJSmr0aGJLVQ/OUHZ7FQBHR5NYY2OewaMt1tc4TZoQL7CaS3WJKpE6tRZJgbWQmCB
	HrWqemHivhYOZ+HaCdBZwD1IDRhc+gMaINNVPf8G2WE3mdQZ+1oiLlsKvbYKPG9nJ
X-Gm-Gg: AfdE7clZGRq+k07QzTOQgh4Z1dgoEUY2GQJ+w9VmNdsy6YRjP/Lxwy1D2GLuSFrZp6E
	6li42F6G7cd6QBPulBgSp9XeKF8dTJyX8ptmmm0+4MLmKsGUIEn5FHp1NoThHxQjpGQ839EdEPV
	kDzG7JLSUJPIYPCrZBhM66dNH/k0qZJBG+yYlGyM9OgnhkN3CfCRJNDvCOthp7xygM/Q30N6Um8
	woz5Yi+A9g49qqc4ymDp8aLh3041X62kAHmzUORgKbUZOSiO11NU+EomUfc8r1nfhTISPjTHb/9
	aIW88D8y/egTlQMsgZm1ZJqMJRSK84H9PM39fq3UKluDKzrhitTkJ+QKgLAjkIImwogGm7zOEKd
	tvFjPuzP8lYA/bknBY+LnZc9Wc2A=
X-Received: by 2002:a05:620a:700c:b0:92e:7592:a168 with SMTP id af79cd13be357-92e9a51f839mr1308033785a.65.1783322092245;
        Mon, 06 Jul 2026 00:14:52 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:92e:7592:a168 with SMTP id af79cd13be357-92e9a51f839mr1308031685a.65.1783322091822;
        Mon, 06 Jul 2026 00:14:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm22602391f8f.15.2026.07.06.00.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:14:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dtc: dt-check-style: Allow space-aligning indentation in DTS
Date: Mon,  6 Jul 2026 09:14:47 +0200
Message-ID: <20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wTlcJjr/7GjgN5KOZqVi53TFOXlRdDit+q3353+5ecY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1XmI4OWIedsVL/ARar0eyXJ9SkqPaNJAUUSF
 qgJLf8f45CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktV5gAKCRDBN2bmhouD
 1xbcD/46UcFfmO9ppFwR5JlEmd8DYtjpDo7vOqvvWyePMKHqShteg2gj2vDH6djH31HndiNapQ/
 bOpmJ5gRu73fOQoiFJEO3PG+IQ8c9Xfu/kmf71ernMYbN1ELomnBQBvVnMvUY1u2lusOZOl+Ewi
 IRkMW11F6XQ2jDpP/sOjCMncO1+L7Q6v5HUc1dPOBRRVt1gX0kwX+K2s2R6lDEmd6u+lHmaqygv
 e/Ou9S3SLsf2uJhio/9L6/fFuVSGTaoWv2Mfsx2WsasFcWFGTTaTraOWQ8MwJznKkt9mQ5Ek7G4
 aqvQoR26eKXLlK06+AQF609ZnkDeYzkp0tC0IRss46hAyF/QQ6NWxDoNiU4MjYxhfJ1fI7kXbzT
 BslYyiNblYj6rFy7+tFVuu1exjZ8GOPkkfadagiChx6LUaPyn2JLgXKXYv6RUeQaZ7UyUtu9JN4
 IOzNS7qPiSf92zOLj7K4mj86rn9NreN8bvIYODirgbywhv+YBxSW1YramJdCcAi9fz5CvgqsJkc
 bT18tkwAcmzd89oKlSvhCyhX6Z3FxmfW1sQhTodmiVQN3yATVY76nUxOzA2OlWLSMEEvfTp+O3m
 59kQfdS+JSn78ulrA5ooZ+47zoh9EEn31S2/QyhiuF5Gmy5nUzQ/bgJbQ61IpDdtJrFxphVQMGI 36F5n35oa4Ls5jw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4b55ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uvWS7H5UGGfQdtdWga4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfX3IhnQ8Dh6KJs
 3Aw8nk/zGyynMjqGdk8xf5EUYsb8gtRqpQUTuKxA+9g3XUgPk8ovF0zkA/2Ceb2Ycm1j9JcI74S
 7xU7T2VAP1sGxT6Zmk7vRsyosSM5PpvKCzC9m/asIY08FOKxX9wME/9zanzbavUnZIPFk02OyP6
 47URqkRqhc5g5o3Z5VDx1nt2QMK15J7tZkRGB7ypOR2VIEmEn/0caTBWV2Lc1IWXZoCCo3W55RZ
 5yIAdCge5+5YA85h0aYs2ZJ4mMcQVqU49EXtQO6KtNoWrQwGkmf0XK34LoCFiYvAnGRAHadu/lz
 c0q9ifBK/U9NMSzIBwTCta+pkCrG6k0sLdYxqf9LJepQ5GVK2SVhu2PrpNbeFcqEi7QOrWIdGyb
 Ovnp/A7FBZ7dv0V+oa3Iwh4PMXM7n/tna6Weh/7vHvf/xh8ULaTTyG8KKjMyRZ0Z7O8GQSOs6X8
 61bcbtgM9vgPRxPqWkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MSBTYWx0ZWRfXxS6JQREleoK2
 zbYT4DNjDyNzOtxSw2vrD4C9FgCQqNJ7FcA0fLkAOW3KrW415OtWv9oE7I8NcLiyocRwPz/mtuC
 JlWksq7I3m4CN5N377nSgYoUXS57YQE=
X-Proofpoint-ORIG-GUID: zZY4XCegU4aAQn8xQoWccG-ovsDPNT0T
X-Proofpoint-GUID: zZY4XCegU4aAQn8xQoWccG-ovsDPNT0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060071

DTS often have spaces after tabs in indentation for aligning continued
lines of comments or list properties, thus allow such cases to avoid
many false positives.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2d5723d41ea3..6d02d045f92d 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -365,8 +365,13 @@ def check_mixed_indent_chars(ctx):
             continue
         if dl.linetype == LineType.PREPROCESSOR:
             continue
-        if ' ' in dl.indent_str and '\t' in dl.indent_str:
-            yield (dl.lineno, 'mixed tabs and spaces in indent')
+        if ctx.indent_kind == 'spaces':
+            if ' ' in dl.indent_str and '\t' in dl.indent_str:
+                yield (dl.lineno, 'mixed tabs and spaces in indent')
+        else:
+            # Spaces are used to align indentation in comments or continued lines
+            if dl.indent_str.count(' ') > 7:
+                yield (dl.lineno, 'too many space characters in indent (more than 7)')
 
 
 def detect_indent_unit(ctx):
-- 
2.53.0

