Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3073DB630
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280237; cv=none; b=S6AEo5GvDl45wA+Bs5iy1f6eAZBBvPZygdxS4tI0eZFOF0n/yxDtMuLts40GIoS9g3aFyo9z40Ig3/0RDz6xiayffy13WEXZel+kXV55TD57TVoagvnxMZ/BmhjnHyp7CuITGt8I0y4iI6xq+himMREkbfTkPQGD7OBzpPcHjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280237; c=relaxed/simple;
	bh=qsPzPjmVY7cJFQqS5S+8Iufy8k0Jcjs1HvjgGJjzLrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfEJtpa9KV5wwpCZYSr3/JorV6UwZkO9oO/CYIPZDmFsmCoO2ByHe22K+Ii5RNJohBMnMFLe9BeqOH9h+Ng8LvP/5cIWGmNCvFb78aLwcwoaLPHHhp4QiozeNyDFqG/m8BqAqSeut+L1f9IYTNU+FNyWaOM7ciekQElMWDIGBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogjUw7UJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfmKQII0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogjUw7UJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfmKQII0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966dt4s094593
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=; b=ogjUw7UJxOo7z8/P
	TllZBRsv8OaKMfawAiyVHrzrteeKnXuOGTELF7UHRgrA2gmkaHE7KE4BQ8Vae3EA
	CKbK/xmt0Ex+03JcpNdBbyB3m2HUrQNdzC9DN6sCWZdRTVrbIm75O0wFV601d6cK
	A0EJNHShUESBZW3f8N7Uajl7ewMGZ49Ac/OUwUCqP8BgxBEuAL86HYucCXfx7ZiR
	zQk2OfoTknWmHR7fASnJ5uKe3PPQ4XhZvJpT8j1jQHH1nyD+hJBWnKhuCksc3H0l
	G8B5NZI61zb7DAKJJSVNerbMu3TzeOQ+RGqApjL2HkB9/V1a4Hw8kTgltod3rJ2i
	sNau/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3k14k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:50:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso2086102a12.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280235; x=1791885035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=;
        b=MfmKQII0iAUSpJJRMIp/wLXI2uWHYt04wcX1foRKnGJSQPydNq74dvB7GxwmyP3ZRy
         MmghO2vNFV1CCECYc2YV9cgdA/7uQRFrWbQ3MEOtGu0ZmG4hkdGJbR6SjLxNHStt5KR6
         BwArNPN5MyxyGHrHZgdJ/9pr4ng4WNsBwzZhYQeJQiqZuZR7fffUfvQ01u0pHaMT3yBg
         hCMXJqQStFp3zSpRlUweBYOkB2rNlQ2oXE2sfyouhg9GfSRXi171IBQLTc5NTYHD1DrD
         iEhQgJM6/KmjxlXeMpB+nYMvsx46+osxTSn8gpgshnuQMF62VH6utpiD6YksNmhS1MVd
         UiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280235; x=1791885035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxyG4KgmEl89usgJJNZYb7Aho1Zz4VpduITf2fvcXYI=;
        b=BMbzdVh3zfV2FLHkaIUXt6kr9usqqvS2YIEt9xv6pUgfND/uSe4lvL4cT41Rnzcxdh
         064XLxFoti7lvJNDYde5LLGktQ/erE3wHAgOWovYBYbSPSzRbTu3ywD48F/z/C780zyb
         xN89EWsLxnG/Jy64rgnRqyKZPEzi72GwtZicJ5E9JS311sLIhMTveA+SiBU8MbFLrryb
         GsgO7+6ryOUZ+Mtr5XC4Cz6nGKtTDM0GC+2THfoiKMGGu6wVY5YF1XJq1TX6hjKX1Xz/
         DFW5HJMCu/2THQFhRv529IRpw6cBagvsumgokRoX6N+ne66iwScYpIxDVB+VqKNMzC7l
         /RJA==
X-Forwarded-Encrypted: i=1; AKwUvBwtl/KEXs6hkHzwW8dRxLxto7OVpgmhtRDfaG6+TpctDmtUZBUDKZWalc/tYPxRUZ+ZAd8aKyn3zwmu@vger.kernel.org
X-Gm-Message-State: AFuF++n5pIb/7dMCvYOqC4JEna8CjFBWIH+BgJVW9H6gwQY6L5f20gxf
	d+E5CPg60Rll9Gf7NkKIdi2QhQ+hdymwURI2mnkSiM8BhDq1P98rc3veMND6pwDKwUOFTz/XN8Y
	2eDGmmpoSMwHgJzQcNgynCwWyKhjhEH9L9YV54QWKe3PBXm7qE9qhs3cjM4qq5/8L
X-Gm-Gg: AYBFou0jT2GdKBhY4DqQx8NBl171NputHWSuiLcekis8NhPMmNMgKKIuVHk/U5/5VP8
	uY9SUVgEunYZPiJ8PfmkNLgrTrKUVX61A+tDk1mjhRRophNFnfti5lQFJXsCWG4CwTbs3GDnDM1
	gFWRGDrnEuHnY7gMz9xQ6U09JCMxBnfbIh8mUd1c1sQ/0uNhYKZPdrDiTqxLhCukppZ/idROdBJ
	0gYHaJkS8CzoZVhgTZ4/Mz9oIbmmA62uwq+iH91ZDHRP4DwapqnNzJcpC9it1f4S2cVf7aJXEkP
	lvNV3mBjD28RfvP/PmawdDMRKB5/SCBAycl0vSeqCTI7ulQ51O6bS7Sea6ZUS7E03+PhRn87A6V
	s6gz9YIWhPSZcOh5huwQdAFWqBeaaDX0D7AeGkxzN2TkJVtf6/V2lsj4YMjW/2Bx+
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr816110b3a.55.1791280235158;
        Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:f87:b0:880:e0f8:2d9d with SMTP id d2e1a72fcca58-890df9992dbmr816040b3a.55.1791280234490;
        Tue, 06 Oct 2026 02:50:34 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:34 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:27 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=712;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=qsPzPjmVY7cJFQqS5S+8Iufy8k0Jcjs1HvjgGJjzLrQ=;
 b=qvRzKuir7c11cUWFzXRoyjqo/4wSU1zZUU0UoCbRVzYctYg5+4INWLYVrNQm4gp6+TNPAprsS
 sxPPAVGvIAGAHKhLZ0HpahkYBg6HolxvON21g/jb7/0uVJNV4FEomIg
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: CrvsK5C_g-k9Mb9M4PgHmLd8WD0wWSfn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXyfkfdJeeC4Ro
 24yQbftUnAtTD21ZnLfgcC2P3UW0Nc6j+vy6vlRU5sa6nzLKTT/SNjgqdJQorc+WtWV6/vL1aGe
 gq90NeO8yP9OJol1ikIW8xb/yolRdIs=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4c46b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_byYVBOMx7OMby22r04A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX3JxR+Prz1lAV
 HnNDiubZHGQ9DrTbTuNdfKKj90snPBbPJopaa9UrK2WnTWTD0fg7eI0G33e7QgelbJHRJ4npXyu
 dIv26uacESK6BVxSjBRUUSFAo0cukGBej5L8bou3+uRPWeYfM688N4BXrAqmWhEzR59bKAeDNRK
 O1EocBFxoYW62HHwgWOm5gByqRw0+XlBYHZDhO220n4+bSmqH+l5KLdGYka2uVXudNsBSuRqHTH
 ZZUATyU44xIKykAJXfqQwaLECy04yDVF5iEtIGHF3slV+rcV5ZP1bYmE2m9zPcAJvHLJ95/1rxr
 EOigIPeQvytyRZHrxfJeFUSrNb4EW+fMVasXYRg/ckL7RLNzhTpL1f1JhLXJV8LXK/hnBuqguHw
 Phcq6FeaonMuedIoO1CHwFpFqjirXwj7UTvekgpLrXgfvaBnZt//QBfVsExyHJgE4SLbShGZDxq
 FMB6Fc+fbvfr0fpPGag==
X-Proofpoint-GUID: CrvsK5C_g-k9Mb9M4PgHmLd8WD0wWSfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..eecc00e2a718 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-laptop-8-13in
               - qcom,mahua-crd
           - const: qcom,mahua
 

-- 
2.34.1

