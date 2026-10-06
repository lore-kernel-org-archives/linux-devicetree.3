Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8B3E009C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280244; cv=none; b=HvpHhRJdhN/5AAPGLZtpdO5EyJxqaJlKX3cVcfNJXEthS1JURxvNO3QWKREBuXzkcwKeA7yeecbEnr5nYjCcX8Rbemsg9J+CgV054aI7MBjFvNYBLIhHJWDYx82g3ykXR0Jvz3125aXE109MEpbMZRLL7c1FG5Z6ra4/0oxhNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280244; c=relaxed/simple;
	bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pde3TDsiIwXLYVEh08bAcd5okB7XRy7R6mJhRWh6q/nOTPBzpd7t1nvRAuNLURIbGX6eTB+VQKL/N4+4LEzwoL9wHtntR0sXFfZs6e2PmWxkl7TWlwPfli+ATT3Vo2zp5g3aQVWG/Dq7J0JuWX7kNS6N0TEc7VbH8GMNLBjeLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXaicJjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMWg3ROT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXaicJjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMWg3ROT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eHdW3269687
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=; b=dXaicJjldr2XiWNK
	qDfXDZ46dH1ZHuY06qcM1OaASYRIwMrCacE4jK2IHr3TMIYqdOAsLV6eWfUV1oy0
	wJQwVNuoQ2fGMeHngAdgX1avYFRHgI0fJPmiQS4N9lIcWZHOgkAfG4IeDNo6Qpg6
	VgTs4iJvko8u+/Ss9gf/ANfpGlm4W3mfuFxIIstk5hiONH4JV564ai6RWqbNWP3D
	FWFYEMe9Qxe39eOIuY874by8M8RVS1d5wLDFo9Pl7Ub6gtRCHL8CRYlLmMXi9j5+
	8nEfVdMoP4i5Rioee5Pza/+B3ZAmQ5bRdysdQoSV9uhsZOaD+NvLKVU+PGIP7l/S
	gM2UuA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkukb9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:50:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8886059d3faso5651008b3a.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280240; x=1791885040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=RMWg3ROTCw3JfMNOgjXdfg94hCZGkH/tIwsSM1k0pzuhALbzXFSeHN64wi8axSFbQY
         hF8qrFjVcrftgATRcpgu8MMvOw/PKZjiBjO3R7ijshC2PrZ8BLewQAGWpyb5Pxv+3yRL
         xnrthGcnKcTYaTXg0UvFaw561nI9tKg7VtDS/7BF5lOlvNkXH1lsLNSwTNNR2ouwn7z1
         okG/YFeZMl/heUOn7UPd704kqmbfSJ8kO9nbAcPFp+UVbzG8MEmG+JUIHDL9iI7qMdA8
         I+yCwEHyRqlSSZaPjM+puzsWgAxyYSyiyVlkDzQ47xf+HnhT0A9o0bxBbNcC4nC/8m4+
         TRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280240; x=1791885040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=Wc0z8yrNSSSc5f3BAETqc1IFZgN06aD+diItkput6SXTGzou25t1UxgQ6gka6a6fOw
         kLU1bC0JbAjmoN376eO+Ap0giG8XCaKbDCk44WTXUf5NVIRvLPuBeoBJvggSuTZosn3b
         pPy5uNVhTakN2Qc9wt2tCXyrJtFkeR6RH/AoNiHerdt1Mv8NXUnl0lVBbBO82iaoU+Ag
         oVEWNYcNWDgd7PMSmuYTBTLgJv+zeYjts+YCUEhhGiZk8oBSX/pQP1zCVGstVcUsRP4W
         guSdLIMITdYm1MwEaAwvghJpOeX1PsH+FSdUP3VUBW17NG8gR7cRhVpNH00oy5yeRp/s
         qkBg==
X-Forwarded-Encrypted: i=1; AKwUvBy25ifYui+HBPMtvSM2FN+Zhazrm4sE6hD6BrGRxIPwmME0WuFQJFz3lk06agXT7PF7oIbP1kPZPbeA@vger.kernel.org
X-Gm-Message-State: AFuF++muW9sQ8AY2Eq4qhPk8plUf8ZRq6Ty99pXGHprgQw3PKzXhv8ks
	al0DZtDnvEdJVy9a/ZoG6EhzWbWfzKUmTk9sQ2LhU7Q6iFyp9tRjSBavzJwUh5vzcIQQgxIw1lI
	V64fnKhXawVW32T564QdOIAbBm6NfCZtHeS1/ocDyb971fJ0ZYjxWkF8VAN6zxYPw
X-Gm-Gg: AYBFou22UPUYQQRaQgWLtdMocI5K4cAaTFr7MjlF+M+Jp4kQdo7Ab8HrDK74ni+Y0qz
	LzshQ0uynWXS+yfySFQGoHuZAkXHTq8e+zAw/fvwgk+eZYNVRlnX195BS22s1t3OVX4ZSH22nji
	Ntavn7vmAWp3la/E1T9lpS1RS77ChDKz5cZZK6vNJnZzPF7IQWr4on1mWBIGoL5cQZgH0UmYsgG
	jqGDmO9tVXYASaeiRlqo23IdP9sB66F/WyAlHonGEgVb+QSEu/pIKnixknKN9czkDVj2bDyO/iY
	PMNj1dw4e/EBUT/paFpcySoEsVbh9rSlmntwXCuhFbxp9kLyRKFI55M1TvrFopYYh3FqumXSQCK
	rqTfcnAHRIcexRVeZdn5iUqBtTvbec72WvTgSX5AaayCOJxIIJWUhKojaO2xJjlX7
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757979b3a.6.1791280240281;
        Tue, 06 Oct 2026 02:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757941b3a.6.1791280239785;
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:30 -0700
Subject: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=2528;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
 b=b/ojm2NGZbp0Hihaqkh+5mmrSWAdCRDQ5tpvVjjwOccVEs+VMtJ4T+47nPUbfO9aodCOtSSnw
 g6lpFt2gUT6BTcag8rVkDL0D1ZjjjY1yknJ4QpsQwHYj32yQf4Gxryo
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4c471 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IFSe4OfV7_kOeEc-bZMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wFCnko8FZBLlgDRmYh0-w64pMRcoRr-s
X-Proofpoint-ORIG-GUID: wFCnko8FZBLlgDRmYh0-w64pMRcoRr-s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXzRpdiUEAXYEv
 McKgy75jKVBLzEfzG0CCxUKuLEsWXA40RsMWDwt3o58OIr9yUogZ1LJxFW5cc2ezWRf59ty+WuB
 gXDKSbDJd0o7ftNUeYYD8pWUPIijEVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXyQv3VF8Hjssa
 iKihV7P+PWUyzMmbInYdeuv7XuC2u+wD4IVo20kew1SCFaFyHKBejjxwx41T9gKB1x+cgAxPwQ2
 KgB2wvrTfTC/gMPyWNHAwtlgl7m4cmi2lDAIL7ZPrAnM+wZCCo/7eLdxtf1f59WvqGLEfF3a7sc
 otIO/wlbLG8rQNxKBnzVm/cU+5QkF+YhCqsVYod41vyvRZkovOK5NkjqH4FEMox4CeoWEu7CCru
 y5c4eml00w+W1QC94Tjb4k39R/XD7i7H1Mg9Uox3l+zuIoB8+7SJIMpgCxAdC9XkenLk6RtUtLw
 ldR2MSMkPBWg9SBK3ohem2Dn1gfzuURhQqbg/r/cf/KYZZcS8S5TAn8RrL8lGhCZ3tMEO7SCBOS
 zvLgxQOAjgqKoouuzw49a243sR5B+nU3GEhGMu42AAvqEUAVp8+3VgzDu5uxIGDrf8gLTw4Cqdq
 11vtQhHCloCcQU6DE/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
is not in edp_panels[], so panel-edp falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
  31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
  0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
  3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
  30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
  78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
  00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e

  02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa

  Manufacturer: SHP
  Model: 0x1572
  Made in: week 49 of 2025
  Display Product Name: 'LQ138P1JX61'
  DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
  DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)

No datasheet is available, so use delay_200_500_e200: it keeps the
200 ms enable delay of the conservative fallback, but uses the 500 ms
unprepare delay of the real panels in the table. This matches the entry
for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5d7d696b7725..3d002d75ad73 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2198,6 +2198,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1572, &delay_200_500_e200, "LQ138P1JX61"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x15a7, &delay_200_500_e200, "LQ120P1JX51"),

-- 
2.34.1

