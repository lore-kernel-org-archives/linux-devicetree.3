Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910914;
	b=lsibAATzwERmcIPtZusoIK4JFn5jmnZjLhkjSUAblH3aH7IpMuufPQ5oClZ1kOWKwkDe
	 Wd548M/S8Cyuh9GzlBY4X9L0sXJtaAzIrsjB+N/IwnbSBCxvCrgXFOosQjwWAPmOmTWbS
	 HmvJqNXa3ttg9/x1714MxN725JOl6kgOSFpmGq8tRfg4i5zF7g32Jf+zhZqWH5ZVPeQvW
	 lbIk0XwFToakHIkr/W7hhlUBZcl7zEaIC5On8yrkrv5/qM8Zq1DIup0zQUfzutM1YyDqh
	 N05q4o/CcWAGyXiMMxAc94JsojFjGYhj15Fg4icB+2OvNylNCHjDugGDr/ikn4Vgl2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
	b=xv2u0PcBwY2ISHWbL/kggVzx3iVlxhuVMYc6ZTcyGK364Mcf517KQHsqN/2S8VuB/xip
	 h2GatWJKimNSU1lPvBkBLm+UZOK6ZYXjr1Yuz4HAc1ssqUEPa2WlQcMQZwLjkOa70x2sw
	 f1qW7Wrc4KIz+sATY1du857cXkxQa0iiqXAYed46eLo/4Z50tkovyONN+rJWk7touCV6Z
	 2nzViLZlPH5A9CM1S3tGf4G2soXDC2Pic4uR17MlI7VajaBO0ImW4eSn1+hh9KwDXqPal
	 CpnLMSfApUABQfnix2QlT5c2ahdiDnVM84c729IwO+1ZM8E0KS+qC9e0MqF0XEkgpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B1f+FXkv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6BDgHi5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992F2606A321
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B1f+FXkv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6BDgHi5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4t40o3578773
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X4mro5Ju+0/OZNa6+ydVcS
	k0tnNUNnmhCi4geW3t7cw=; b=B1f+FXkv7WIc1WX7NfQd2k+7LDtBtPw6hPcMIt
	uW6H1dkF9SaIWgTkE1hA1ujDe4uygBWA7cvg29F0TU8Jere/U8kuMwWnDmT8bn9Z
	Qgzv/LAYC1sK7SMYsfAirdS37PjPbqRDVDxB0bTAQ+iQeV/ubg17HQcLJqZ8oz3W
	oxiOcLFgsrGKc9PHZ8QIoU9QqI5yx6IC0MHF/KHXh5Jvm1TQ2yZ06G5RrAbiHgJY
	g3+wUL9kDSAGxZ3X/m2Zgwbn0SjsW3iXJ6G++7baLJD0jPtEwj7zVAlRJuFXt0WG
	TH7Qot5Mgqz7AAYrXC3hpIbo7lMY5vYWiSA/zNv2x+uFg4EQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3jjw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:48:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0fcfso346992eec.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792910910; x=1793515710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
        b=Q6BDgHi5LcE4ayEdpYZwr7s7IwLaZoSv/v+TAHBcRYrXHwswhbI//0rmvt+qvQ1dQb
         4abuOXwHrQOzTqUZ16qjTNAvJjsmkpnjqmmtqeDMXHPqEXofhw07oNtP5FvhvnbpDH0T
         Ka/jzrxoWIK6hFgiQYBUyX4nQP0FQEV3FfWCNeRPj52VtMhTtrmRLTcG73sBL3ou9WAp
         D19wUyz3qIxsr1Pcgzb+R6p4hbebxSJ2LEXZO4+JpOEUz1Snli85rm9xRodKNfgOiU+q
         FknkXnLUc/jT97u6/0zOM0xZLhqKBCpqK27WWnUieKhnSuglyyYJbhmz5z181LhdtLr9
         g1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910910; x=1793515710;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
        b=KCwMZ8SjAaVVCvTaj4gitIUF4MPTN/bYwZeN1ywbgnWw5B3ubu4e6BUBmTsc+00Vt1
         MBMbWjhlNKN0BLCe1DAecVVaeVQSjKr3/SDdYdy9AF2QPszvLzP0AgeA1eKV5B4YLqZf
         R+1uq3idLOmnUMJIDcSIEFdgseJYoRtF84Sb9k8UnEE5vjRxmYqDCCh8xc2uNuLiCkyv
         MaUb1Sds689akHNd88XM1lRjB5vvyR4ZT11nV9yp8heoAGZJldDXbWTeM98qNCKzdIiS
         ROoXat6mco597XAawk5lKGXVzP2esYHlxlW26UO8bkciNFr6eSb3WeR8Op8hiag2zGUP
         OFsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzou0W6cxm5NbAv1RkEKfis5JWnKzwa8SQ8ExJ0Zq7z3iQywfbaVbrc9MvWi+Iqx9nkvBA7x8kU0BCC@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4Jkr0A+5HjvmYlzNsHH+F3qp9Ze3hqu2XUibVzDg0v8HSjWC5
	fkArBJUrUvvo7NFhId/xlrj1Nfoz94YADGYcXQdTDjhP419TFK7ZKs5sfpH95QbsPUP0e1oDr2U
	md358wixkK3n4gk1CXcNu8BfsmHgg04LW8+JlO7eXby4b7p3GLzsMOejAVy4fXG3xO8m4UHKN
X-Gm-Gg: AYBFou10rVYqQjTbWKPcwVPYa4++Ptpqc+pkxvSSZe1GnDoAkncCt8Wk5DwW0L46GUl
	+fd05gEceTCC3m5BTYad8QL+/OV6awpr6uqAoZ98imZiNo4rgKGDGzNA6F7eSfikApUSG7zU/4p
	YRk5uGpN+mUa2w0PfcO9NDDv5MClV1feX+TYfteL2TmpDypnkYDZOsHyOlwPlLwzKUQ+3TJMUJx
	g0U/uIKa67lT4WpV2FlSnn5tKUQ9GnLt7DqIzVanFnL5awOLVWuOX+rVdQpBq0zplHk1SBEY5Nv
	IhEblvrnbpoEac9XDCgVYsugEgCYmIu5p6sASjtuAP1MEUzGUKlcscyH+qENvn8kV9MzmKW4FDI
	Ehr+Rqk0smzoYZVM7jEFYAeKTOlLbX4W4WLyB3HZX1k0ld5Kvf5SxhjEAAAYEzrCNiBsW4x346J
	nMIK7rWkxTmLf3axqn9YkG9p/GvxE2iHQHsMKUUxlzaVZusloTdAlb
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr8345553eec.0.1792910909969;
        Sat, 24 Oct 2026 23:48:29 -0700 (PDT)
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr8345520eec.0.1792910909428;
        Sat, 24 Oct 2026 23:48:29 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm13649886eec.20.2026.10.24.23.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:48:28 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 12:18:17 +0530
Subject: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
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
Message-Id: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADCm3WoC/x3MQQqAIBBA0avIrBMmoYiuEhE2TjkkFRoRhHdPW
 r7F/y8kjsIJevVC5FuSHHtBXSkgb/eVtbhiMGjaGk2jXaBptrQFWf2lCdEhMnVLa6A0Z+RFnv8
 3jDl//RLYNl8AAAA=
X-Change-ID: 20261025-dlc_backlight-c00d00ec8f62
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792910904; l=1110;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=KEjEjjiW+qz2CFMhiqwDXwGVoBcaGxFwtK5Yh/btD6w=;
 b=ylj8Su/xsVS1c7l08nNRZ+V2yiouVkhZg1jT7eGaGd1z+hATN4BsRBfwWI817ktPIOmaDohGF
 AVCrKxZAdVVB8JVubT0YZ2dpuDFX2fRBC/RFywHiADGjoX/5Coo8lAz
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: LFIozA7131-FK6cQUBsjGIfhr6wbQSJg
X-Proofpoint-ORIG-GUID: LFIozA7131-FK6cQUBsjGIfhr6wbQSJg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfXyj1hYADWkOG2
 8Zkh/koDQZWPY3SfQRWSfpzzTSdUPlAwxP/uJahcbNpQdYy9LSeii5Su5aI/2maBLp/a2VOj2zJ
 zZMrSxa81BiDAqzLkWImcsXLHJj4g8U=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adda640 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=In323_k3SEhDHscflrYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX09Jnvv8+wHt4
 cwo7tcbCsZ317NmftQwBcPJdHft7WEQSSioskSt2KLk0SXQFu5NJ6aJapXna7ewBKbtjgO6X8Lj
 VUfPOngY2/9nb/9anhC1Qjkkcp3QZDn9b+lzDftQ12ulqnekJKmdi4aK9Gqj01ahWjPVXhuSrq3
 +BIb50qQHniCa+xrmYm79YD9mxzBE9Q8qRPLYgzPBmTG1eqzfB8ny+LDh0UdgCk69F1+7DF8MRW
 fJ7uk2vsNKKlDD6XOaTRoK6cg4HIGYDsK+A9vyEVp9YSzVbArig7y7Wkfrf8/f9LYk1z+gVEoLj
 Ct8BLAN0s1yFujrQCf/mAnTJB9MzOtOeQ9Yu9aZOoFTwjDlrrV39q/Y6u1UqdmTtbwmE0Y6Z2s4
 +rloYC9BzgkqhY/OZOF/8ardcl8rBAfv1wxlUsR9I4m9ZK1Vsqfj53kgYMo1DztQRNtOL3DvtSU
 eUz5Hmsl1FptrDp4LiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250026

The DLC0697 panel is lit by a separate backlight device, which is
referenced from the panel node through the common 'backlight'
property.

Declare 'backlight: true' so the property is explicitly allowed by the
schema.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
index ba8c5bbf8ffc..46b941c18565 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -23,6 +23,8 @@ properties:
     maxItems: 1
     description: DSI virtual channel
 
+  backlight: true
+
   vddi-supply:
     description: I/O voltage supply (1.8V)
 

---
base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
change-id: 20261025-dlc_backlight-c00d00ec8f62

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

