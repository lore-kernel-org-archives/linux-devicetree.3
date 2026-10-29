Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279380;
	b=31o3qG8UKF5FARP9dTaqzNYN50qL8w6LNff1hl++htfhLDonR4rY/7sguZMrL+idIvek
	 h1Fy8quqFZemqmk2USKdRegkyLWWVOjWVw9FuU2V+/FmqBxG5fXwD3NZsXBpfHyIIYrPO
	 jEk5JC+JDuoHcmbkIWlMWIxY3uPWVNhdXXYzq2SubeZAusFQkTPpNoxHonqB2vbR7TmBb
	 g+fCdUhmNIq5z5QG+UMktljG3kooNO65JDDbcux6oLwSsx2L/6XYBJRK6BFMIOaYV2KLE
	 iohZiGSvaYD9rR2z/wmHHidt2nVs5VDxV5ONS6YVusdIiCJRPnS2mJPasNxPPQiMz/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279380;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
	b=4INJm4bdh5ngkeoP6DAQ+e0xFx3QeqzFLlmQ/SZcnLfn06khyiu0F8gpl52URsTOdsov
	 MrsvsPZ1erCkGGaayMRC0D5WjeR9U43GydgbnESeEFwLhmNLDzNX8cKn3qsErKNQl/2jG
	 G7wXZxW07mBdngvRKl5zR7NtBRHNULlyS38WxBV57cFmKgr0Ij7VqNn+ojK2TcQdZMT4e
	 dgLNGmz/U9OIReUn4swrzs77bLCWml6K9hxqP+llCF2tc9psofEWrXaQWPm0xapVsl3MC
	 S0wgN6cctn975o5glor9XLTZYsR1trOAowCkDM8eLay6dCV5flWZ/0W5g9cGoe7lrsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzlnjI0J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvWP7mIO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521D606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E521D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzlnjI0J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZvWP7mIO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdoxI1147250
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XFgV7hQHnaq
	B3LpunHXmA40D5cDU+9hyfeWDV11nSSI=; b=gzlnjI0JD3BTnchNvTSWFHIyEB+
	0+tMXKU7Fd1z2nbjG0g783Kw0aKRHyCF/3WUkeNLH3EQ7Q5LPGhIljqUrVro8j/g
	3sVBzqUPEBGgXewhRP2BCpFA5nwFsuwnd6gS2aa8ebwJ4alSr7891ak0FVD6sIlv
	lAvmjdsGwsdLGMqEhK6q6+W0NQQ/GNrReFRehKhuUd1gbWrbGkq406CTFXT+vy8f
	2YjyIF2pyvOFWyekE7EtH0+ZbtgSH6RvhuI+a65JDkUdCRR++5ezKdLC7TFFLeO4
	BLDMeHYcOIRN/WZe+fXL6w6y81VyihJgsDhWSLQJTUdtIDmt7BkWKG4GTyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44q8k6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2063327a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279378; x=1793884178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=ZvWP7mIOxekQcq0Tkwqcf/0CuSiIopGLEdyPSY7AgBSHbPRzLPWiEaxY4qTF7qyH23
         1/y17Sn9CY0m/dgfm9Iwfc3+hUmZ8IJfttAe+a0qxZuJiyrDJ8EzbOmK9YAz594e5ElW
         rp0d/OknKvlTEXc7nkQBRZhf0zruMxNF5eYGP4ZogIPlWlRQrXzXskZWkJRkISBJqVBc
         AEos7m6Fxgosiuim9E2Aeib99Tj1SBnpD7qJ3Ot7PgIsJPGaCMbnxQ9jra8mcNsIedKk
         XMLdQ6mMoj6QQc9gVHAx9/JPRY4ZLviV7Dwuf19hyn2ucIIzHhmRsues3EgmdRssAnSB
         vX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279378; x=1793884178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=uQ4H61i8dgtA0t+5jfq4dHH9yIi3+P7kJ6tHnV2y5PVCO1pTK9oosNGU4sB9622MAg
         aMTUwJ+GZ6F69DvJ1GMqKVyuJUx9PwjcfpYFEDc3qV8aPQ9Ha9U83/l5KHOM5QVUld2d
         cMspWOjaVTEei3HwQA1Zoek+Nv6P+QxlqEYVh/x3PbC2nNSrHkZek7LPBbdRE5cTCrfc
         8BPjcQL2ciPzySwnG6ep5IZtgC5UsJyZU743OEqdhTjCNJ9cbZPLrtfpf0PBQKGOryoG
         7QRr1bR3Og9N8KQSzRinoVukKBThRPgyUKOZEIeiNq/qqM7IYChwFR5TyZwKcvRnuE6U
         W4FA==
X-Forwarded-Encrypted: i=1; AKwUvBwRZnS1n/9ebD3AmLp2swzaDCqSFxCTfS0oPLMlAEACSnFzPFxXEaNFQxijeuwypw0VV9AGOanFbChC@vger.kernel.org
X-Gm-Message-State: AFq9FYKgmb/OO4NfNBJTG6h6EP4HNvneCpLqvCHbXzG/4AbbH2ntRL2j
	SMlf9gH2dQVlJwuIAnvCDmUTNk4kJ9evi2tPLxU/VUqoSKWwLRWIp8NajG9fgKeH0Oh39UezLlV
	ROOiWmefg8OiTnf/YSbONqdO5G8zagHn90Z36OJfIaMgsX0B22BtbyJAOfxxUFCOy
X-Gm-Gg: AYBFou2AU5DK/gdKin8+DuCKDXNdQpHrxjKm3VcYW8UpPp2eMV6bQ23rpiTdmx2Jens
	q/ekFunYBTzBvilEWCVja1wF9uVIwytoyUICG3GuvYU8V285Ai0PUDq3OUU4CCqfqY2XZz2vBXs
	AajkQ0nSaxU8vPUiKR0213vg/kZBaSij13MAsmh1uumHUtW1T/wEW6LV3PsOz0v7cbzZjNONMe6
	6BsKZC03qDfdsYBN+UIJrS4dtatnlSVT3LUIHg6jJiszASm3O7EXOhsd2IsIvYt3S2U827sAGCh
	hFQeooTLWuc5ifn/9iR6mg60M6rNwCC9wPwPkgPtQk6EEI0+D/tf4rvdhgsELNKBDrdu3dgegbp
	4rK4oJRyLUZvos3JYkZlX3lnKuaPn8IRRDMvvf1p0KA3NuOy4uFzRpjNnbzUBZ8SzUbeo9IHfV4
	5Xc8u16Kze7wKhSUniGBWs9LTGrTM3/Da9Z61RAJx+M3tgiwsszAKLjnmZHNC3akG2hhCOyyu26
	Q==
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046514a91.42.1793279378461;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046490a91.42.1793279378010;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/4] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:10 +0530
Message-ID: <20261029130917.3714691-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX2vgHdIMJuJwr
 aLRfLqdV3BfV6BWjVt2j/2S3fFNtIjYjk7gk+OsH7yl4+HBGuVvS0R+h8RQbnJrRFHxXpXRmIFf
 GC74aT2EMtX8E7QRPFtJMIq+VibsR7o=
X-Proofpoint-ORIG-GUID: o1JPAaZcWo0c4dwOqEfYIU_ESxSUaY1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX9zVU+scWWKdg
 Vldb5QyNPYea+xlXSa3Qm4milIW5bzvSNq0z25CYyu2a3aiDMI2Zne2Nn2c/zRzIUOgZQuNauae
 HjtSPTCP/TvFMpSo6czt8w7b7Quz+MT3/9/PfYBr//IMn7KqHiiSz83TlQ3BGOv0CiBSlwfyBS1
 fvsyUnhHTY8B2RQjKk0laFh12sM2jfrec46aZgH0f9CaFQRqplWFQGjDhrkp5XytV7bMvlurHd2
 xpwKxwMydhpH6d6NTa5FJIguzphtT6APh7yK7Pw+V0a6YAzLr0W/LxxVTjhMg537n5L93dkUNpo
 3fIiNqeQotUN+l9j0LOd20V9TsCdymP7BZSPWdNGFwPA72p6UP2L2JoCl5g7ZsNDNRL6w4A9YbN
 GDRLE2VUPhNkvc+hhsRC9ncgZRhSwothuAB3q4ELmdnXNASKRTQcQonnv3rC6nORu5FX8rouTTj
 5psP/kVJRe2VMmxIhyw==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae34593 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2yNJKbwY4VjyOEKDNOIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: o1JPAaZcWo0c4dwOqEfYIU_ESxSUaY1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290051

Document the RISC-V Performance Event Sampling extensions Sspesa
(Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
Overflow Interrupt) in the ISA extensions binding.

Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
is present.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..5c1c0d308615 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -269,6 +269,18 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspesa
+          description: |
+            The standard Sspesa supervisor-level extension for precise event
+            sample attribution, as defined in the RISC-V Performance Event
+            Sampling specification.
+
+        - const: ssplcofi
+          description: |
+            The standard Ssplcofi supervisor-level extension for precise local
+            counter overflow interrupts, as defined in the RISC-V Performance
+            Event Sampling specification. Ssplcofi depends on Sspesa.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
@@ -977,6 +989,20 @@ properties:
                 const: smnpm
             - contains:
                 const: ssnpm
+      # Sspesa depends on Sscofpmf
+      - if:
+          contains:
+            const: sspesa
+        then:
+          contains:
+            const: sscofpmf
+      # Ssplcofi depends on Sspesa
+      - if:
+          contains:
+            const: ssplcofi
+        then:
+          contains:
+            const: sspesa
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:
