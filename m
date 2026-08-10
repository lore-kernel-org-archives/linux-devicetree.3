Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FF41CB57
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373882; cv=none; b=Qt+NhtX6s4fGcO0jmC0LSLNPg3iuZhdap5GlQNF9HiO0TbtgW40E5VC6dJMz70lj+aZeHcbaG5TOGEZ6TJlqKiZg/IhvhrBZgUrGkuGWS/DEnLrFbkqmrpM6IR1ZGW8+JndFiMeOtTZpFnJ0fhbPee+ezpcEz/sDt0wWrr7Nffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373882; c=relaxed/simple;
	bh=qVqJBVOQMtfirprOedA7z/gOwg3MWqFV9hNvPpYASs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xv705PIXVf8jQ7LUrRlAh7aIRGDTbvSMr2tNC71K6vI4p05KDVdOVDnWwvNMGh6L7j+tEF4ks44xnHGQzM+cRWw223lgbOw52ov5OGEl8QFGAF6q7CSbddNE3HW74GuAUdGzU63QgDN8MmsEgbBwf8uE8esXq6PBBC96+QszHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8KPMbHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ygkp63fI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8KPMbHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ygkp63fI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACkl7V1311180
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdwA2wmRQHckIWAhOekrolL6CsXQoNiZph7xjDqyoxc=; b=g8KPMbHQ9Z5dmEIs
	78q+6h3q1daAEdSqD5EhhFFiJ+TAsyNNyWl8f/h8rdglyqC5RgL1fDbSceAgFgs8
	92iHgEr8c0MCgESZkAqtDTFPFN3OwK3Eq09LGpYvGuEQP15DDykKXhsMYyLT8I8T
	js63gbGvaQLrTdAnA1NkxDshpRR4cjy/oZmHYvLWjboA191b/45sIv793uwvkYuM
	pW5IeriDK9+epkkNsSh4qG603MIKNW/4ozhXQvMxPSXnaLcE3ApfylYlUlRizl68
	4zAFkEuFT1lmW8oN3VtLbj8/UKVlqUK+sGcgCXR696VbKSEfj/h0v9+As2ohjsmV
	egObSQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqs72e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:58:00 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ebd75fb5a0so970506a34.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373880; x=1786978680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdwA2wmRQHckIWAhOekrolL6CsXQoNiZph7xjDqyoxc=;
        b=Ygkp63fIZtwE256wBymh3DjSFfxPqUp3f2zNJeUXOVaSGMlp/giC9STEMVSK74jAju
         kdFNjtCrIzfRzbHmFhrsja6aQYTKwOmtcnrQu8eRb38KlngVy9wIKZNDTwdeNlOBWtpq
         tIS/eGQQI/QnbKgyh5zMS/kzAbHbYPaFM2PqsyZjfVgrYxozv59KxDSlADjQ5NjQqusw
         boOkaqVaku5InKX7yZ8PdPNQU2lEhZj3n9v/3YyCsXNdsvtWCGSQVWz84G7v4l6MmMPm
         5Oeu2T1yYlRdEuGJtt+O5LGQwNYmTAY5jtifwloJfhgjFO+xXRBDiW8yhvAdQ98WByoo
         bI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373880; x=1786978680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdwA2wmRQHckIWAhOekrolL6CsXQoNiZph7xjDqyoxc=;
        b=ZWtk11VaheoqhUXE0E2JmECjrXcl14IGZ4KJw0wwnuhd+81Y826xs0f0jxgrfVb2YA
         7EStZE26Pp52L4JJtDxEup4ukuZ16A4PFNTSTZHARcMrMC+U+/hnhrcUoN8tyuw3b928
         mhmBq3LQpxW6bStV5K65jcAyZYOuvlgBrKxOW9EpouICR0Lo4GD8kGbSr1VBaTEbWOp/
         AnCu2or7fGiuGprG83fQMBa5jo8ymqp4dHsiHhpYfNZVMT+/mTZEORLJPlfwmmVjceyQ
         sUuEUEGp2PCj5hCjhkjiDqEt63LCg7oxMBxnFmN/S8BA1oa1xsXLERiqYm0uS7yVqA2u
         0fwA==
X-Forwarded-Encrypted: i=1; AHgh+RqM6W5CFdbeT0IMEF6cXZx3aGJF5M6I/yhCsEaVxi5Wpi8eb5wWLJZkdKbi56FAzM0jdtE7+Mx7CToX@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzYcIwDcgUxjxsszEgHWRDJGyQu69Hb3D5Eb5orFQCPbF2eKl
	VkfuV0CNyLHVuQJ3DUFe2tS91EJqTVQEVuZyn/IshwUduSlCMHh5Uj2sxSQuO/MAk/bDoN2VpTS
	9is8Odyhzu2qhZXzV+PtEekIVV3eicoQE7Qa5Umm/qAnHtMipxZ+zndIvTW7WrA4i
X-Gm-Gg: AR+sD12KQO9jwMzj1JVfVTUdyUPrCM1OuJsW0Cy/plmg3cRfGGxvRGw6CCQJv6h9xkR
	kIxm1lyGsmgoJKX2xkMN8BdUkuTJIdAK+U1qBRll/fnfoRPY5z5i2S+6qsUw+iFNqghcfdX9Y/r
	3iIJ5DxAynr4smjt56WOG9XE8HGu9zfLmiXqEbHAwesOT/Mr1YaWXagKNPGuiq5y+IRJ1aVQMbn
	ZDMbbJQ65CAdj/eNEXt05Zuo7uT0PBPHuZVrBpIq0k2Ue+lkzqTmyHGQoDymApHcyjdARVOpsr1
	97XGa93vb4+GwJHgzL27oBwaf7SdZuQeE8eve8OjLw/TI9veySedfekCGrjrPDlQyYyouWFFvZU
	2FhmRDu6a8fqfJP8+dLUU8rl4RhZlmkNF/PgVMaNHVqd8VBtKFfNLXuNdlF1BD/e5TvjuN1KFYW
	5otIsRNFmI7/QxDaprgk3q
X-Received: by 2002:a05:6830:6d44:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7f1e5c77cefmr15118114a34.1.1786373880135;
        Mon, 10 Aug 2026 07:58:00 -0700 (PDT)
X-Received: by 2002:a05:6830:6d44:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7f1e5c77cefmr15118099a34.1.1786373879705;
        Mon, 10 Aug 2026 07:57:59 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b806fb3sm7609792a34.25.2026.08.10.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:57:59 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 20:27:30 +0530
Subject: [PATCH v2 2/2] dt-bindings: display: simple: Add boe,dv215fhm-r01
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-lvds-panel-doc-v2-2-f2c2fe309989@oss.qualcomm.com>
References: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
In-Reply-To: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373857; l=1155;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=qVqJBVOQMtfirprOedA7z/gOwg3MWqFV9hNvPpYASs0=;
 b=Csm0Fl6VuTo5xyNu4TKuIis2gxQpm2RNndEWu3cc8LJQdGBgwSPaRHZR1aquqRdlmaPph/3j0
 4NrY4JRmxOXBusFhNlOh8vlk0zOJROia3CwSvcTyDtJKChYsIjZnJnj
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: N83SRq_NUEsSAilh-j_KFOjnSgE4aVjo
X-Proofpoint-ORIG-GUID: N83SRq_NUEsSAilh-j_KFOjnSgE4aVjo
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79e6f8 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fMfOcokNL7symIEKlBMA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfXy/IvWpZtFnFX
 7efiNeZqaXhiMfRiySH0zJloXZ5TLqdhcE9ScF5LWXXvkSipX93Y9tQxS2YojBqWpanCAD8yi61
 l+LBLIegMtWXXX+N7o6fI2FYnCjW4iXY7Fbdkjqcq7baqC0Zc0qwZnJVaOLZ4o9UkmvFCm58Zig
 k/g1x5QiMOHB8RRBBs92zJAex3RzBJHKMgxtcjmmnKREGnfi94wrW7ZOjVv5NmCkxuHu+CtYwcu
 k0onF324uD4IAJoTismckbTs9YQCNx3xSHvu/YPRt4AJlqLZVjuL6cN7BozqS2AkoDhCIMlmwUo
 +DIP0gt5HHnEuwNoujGLu9b2GphFqZpfJiOzRrN9Mh4bn0zkwp0Fk6HSdyZJIUUzYJ2GiTy2p2u
 xTjRxEWsV084DFIvAJPefnV/LxyPL9a1Axz1BtCkSD57qZfNhPnjoO8UjhoJHFDqQs+/4LOOemk
 sTNlnk5fONm7zH0jvTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfX/9mw0DP1wUst
 vaGQ3bKxZ4+IW9HAKn8E8gLtibKnCjuncypTeoDp30JCjuy/160RFa1uT7s716psTHWYzigAw1a
 gBWueakO/yTQNTpCxE9OTCIZq7mKgJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100129

Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
compatible string to the panel-simple-lvds-dual-ports binding.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 8a2f6feafd37..68beb476fb48 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -44,6 +44,8 @@ properties:
       - auo,t215hvn01
         # BOE AV123Z7M-N17 12.3" (1920x720) LVDS TFT LCD panel
       - boe,av123z7m-n17
+        # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
+      - boe,dv215fhm-r01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel

-- 
2.34.1

