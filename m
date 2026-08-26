Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1BE26ED3D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727976; cv=none; b=aeB+ExbUwl7Ebcq3auR4uDomoupXR+TlUWFn1nvPv0gBTYxZELMmlvVdZnh+9GJMAAn+eWzlCbsUIIafqLYnsahBCeO3id7FlSP7A/oNoQW5vydUkMprPAfmzuk3+pJE0h9BoIPFz/gEW0h2VffVRu1CCgvyMWx0zdmBUzkymA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727976; c=relaxed/simple;
	bh=XgMC+9YCnIfDcuf0C1P/tXX3uYOPqXfgCi3ocFWGhAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pP1/C+wCD/6bzeVCZ5T7nYvDSXD2PRaA90NCTOChEGwdhb6bLT0JM6HKIb2bhtDPnmgDnoCPM0RM820+oIueseM7Noo227uduj0wWwKoswB3kbow6itahChbImn/47AL6TG7A2qR2ZMFwGnDSyZX4bVEr22CJ0aadN5QQbvaY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekdrWDZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3t0ZwgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekdrWDZi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3t0ZwgQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S7O54097221
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k9zI/cXXBRjGZOY63sBDqr
	DGW3sYLrT2gu7iI3zQJOA=; b=ekdrWDZiDzcX86k+bGOo0LWoTBcIihO7Jp9+Z6
	Otgb6E1qA/CLCOJgrXf67yANYqbhHMdNCwJz97eRQuy2SEjmsFqkbnIjGnyhnZbC
	qEB/V6QqvYM7bjJ5A5hrN55FULLCIVMuNXieqLXSrv5H6E6r8vF9ZdL7XCTHL1+k
	DSeiK5+RT7AsfGjNFSfoeDStnKolpzgDSLs2H0ZtWV8nGvbJhtfUQKjYWG25y4qa
	BVB65o8iNQkVwUReYsMiYO71qgsNpUag1yTFXMfficZ1ytjaApilYa++RKuKKfwE
	yRued9/wjC/bbUXZ3k5OBoWHlQepBSrm7jiKix4Z1fsw8Vmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcetkq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso21527021cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727973; x=1788332773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k9zI/cXXBRjGZOY63sBDqrDGW3sYLrT2gu7iI3zQJOA=;
        b=H3t0ZwgQv47h3Qp+ypE7vDHrF3R6T95V2UrYMAXmLHkuI6hx512PM3HBUDxnCASnw7
         l6tNnBis0c6GdrtGOv++bd17gPEFeFxHdrslDT+cHe5/cF5zx3h9VJz/C1blQa3/VtAl
         ByyFXftPUItOOXxTwVrQr7K9tiqdOi7qjFP/XhgorUWmCCiqzUcbvdLw07oV7efEGoPP
         7UBkxVjyC3zxDno70aHaV8NufF9tuqlZ8osFO/UzTwiSsW2mpik3UC+K5IMBxA2OHB8o
         Yd9YVhFoAbUMuWP8AM/j/WZTrxdc6W61YAeYfvhDesikkBZjIllbtU285dZWmCfyg89J
         EHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727973; x=1788332773;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k9zI/cXXBRjGZOY63sBDqrDGW3sYLrT2gu7iI3zQJOA=;
        b=kXOqZ72uuRgW/J9Kfp5hantdAiKql/2ZK/PDOyK/6OCFwx03a0pgWA3RT4fFTNYFWf
         fyEzW7p3eHNRBsXOI5uxG5y576eWXic43rxhOFPK9Ge3FRJOwaoveIk09fHmxBZsZvwf
         ArYBMmlvG0iZLH9BPK1P1NfM6VDtk5rtx7Uq0SHo75ns1biOKh5oPKZDzxv5gSmtu8hy
         LbzBrW3xqjNElIiSkRq2QXikDb23y8HA7ltjkVCpn/wihmqYCcRbb+7BPTzjPaz5HYsn
         UjHJB6VTcvyH4hro6j4nq1YfNJIAUaeXssOG0uo8wJu3zyFnhMZGdsHbYbBoA5nB/als
         6ygg==
X-Gm-Message-State: AFuF++mz1Z5r9LpcHGpC/mgJcFrhu35DXORygsHoHtjtQDSI2VEg+y/X
	7q4kSeSus4oCIucMJYz2NWZOiYaEMGLZU/LfNgSqJ2ju/7EkzgWeORonZPgP6rcWiLsrMXjCdqf
	gk7S1fKQ+y9tTuNbGIuhtNJkMzUyUbE9D4qGFuBt0/Jzh5icu2ZLv9QQ1jp2/Zdk0RFncqaqq
X-Gm-Gg: AR+sD10KQgV+tmkl9VEp11irnzRqaZCXRw1rjgI7M+5rShM7vcubkC8Kg66h1OcWdeR
	kuO71v43ZlN+IrVq34XLUO6uwKvmn9xhUqiN3tHdADo3UH8PUHctH0F92BPknxljdMavLIWjr/W
	roribgJvmG6FYqOlJlo/9sGIsF6/RZ6CEt5VxFzsJm92E606quKQvQiNOpulncG47EsWnh2NaUq
	IPHMKO4CQ8XwVPtPKHOV8L6IPK+UWbRnGQygOT1qdqUQtRPaWBmImeN95uR3Vwi4QQpPQAQ3bhf
	2IvOXOIsZpkS/bPB42NYMAb0ZKvXYYkuxeJH/FAIV+ysgIQmNGFqPbrB33qXa2h5rsCU4EpYxhe
	2jufOnlGf+3O0TarBa97QEkc=
X-Received: by 2002:a05:622a:5c09:b0:517:c582:9161 with SMTP id d75a77b69052e-52e2ec50ef4mr136005451cf.7.1787727972710;
        Wed, 26 Aug 2026 00:06:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:517:c582:9161 with SMTP id d75a77b69052e-52e2ec50ef4mr136005121cf.7.1787727972326;
        Wed, 26 Aug 2026 00:06:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 00/10] dtc: dt-check-style: Improvements for false
 positives
Date: Wed, 26 Aug 2026 09:05:53 +0200
Message-Id: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQW7DIBAF0KtErDsRxjHgrnqPKAszjGPaBFrAV
 qPIdy92FumiUboZ6Utf78+VJYqOEnvdXFmkySUXfAm7lw3DofNHAmdLZoILyZWQ4MHmBClfTgQ
 4EH5QBAw+Oz+SBSM73pBQWrcVK8ZnpN59r/7+cMtpNO+EeUGXxuBSDvGyPjBVS++/W1MFHAxvj
 O51q6TibyGl7dfYnTCcz9ty2DI5iTuquXiGioJKbKyxFWJPuwdo/Rutn6H1irZKyVZopO4PdJ7
 nHwUdirGNAQAA
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7711;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XgMC+9YCnIfDcuf0C1P/tXX3uYOPqXfgCi3ocFWGhAQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBWw/h1L4231OWweFgcCSpNruxm9iO9OFwHI
 wdqrdm/00iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QVgAKCRDBN2bmhouD
 18aJD/9GlHulgr0upRFdrCEPyDGr9FIJlho9Gy+cXRN1CVrFRlUUwmuYrfRiS8dNlIW/XUlumSc
 Hs5f4lYXx+99azylnJrdvukCIa/cWO1d0FDAJo8bl0r05kJ5l6QwO86aqpr8SyQopWNUu864xkE
 qHVH6Y2JHAY+lHdnn6YPLJBQ9e6z9R7h+dzG7B+JYuaZelFpNmM/DaahMiqCZz42vtXxLRAhAwb
 zzRXfbOp5Xi0zXwxs5Rq/RBiIFYCXPDGxhHYTiIlO9t9GDxPb1UEwP5Pv4Oe1Op3phFNBR9FiRl
 mJCOixjrQ0oZOyFaVWLQQJwpshUoT6+bEmzZR6g3c/tfdimaNKZ45ku/TMRNMCaCon87Rxk7I3x
 f0OVVpF3BzDBcAgfvu9pkEctLN9ysHbZoC6ATNVa9FcnhB4HTmzNdM2LUr6wUmRh9FTmR2dJ8+x
 Zkc2qU7iRFmGa7sWBEFAhxYZP0N+t9PgExin4mrvsUgaLIN0EFhbmMW7B2mM1QhVRLk6HlhZCjw
 RtHLRNMV2B6QWeH/m6w3cq3C6JxIW/kkw6hL9LWO5eouax6ZSFdyJk9294IozR3AnTh+6f8pWaj
 Q03m0BIy+m++94xSShQ1/HzhMGaZn2SJMy0wUHeU0yZOqJvY3yZNpei1j1mZy55LefhhUavsSE2
 LaOKUXELDeaxv8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8e9065 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XOA7-3rBty5MhTgeqGcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfXz5D1a7dYoJdj
 8pC/kH9ylBiIbVOhnRQLWg56PY/0uzi5POl3g6LES+PsofmJQropanZ89o1rkmYn9J5+/yVYydu
 rDK/RsJz62N8HKa9QXrcoc0lLViGZ7Q=
X-Proofpoint-ORIG-GUID: V_kbVWWdeLzcYx6xJ2-s_1ytwRpiJVLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfX12Vvj4yn91Me
 B+uKBwao/+heup0cwe5J/Rcx7J0pc2YwzTSdKSc8ObgRotZZDubFLdUULr4BRIf5eH2vrkQZyOD
 ntZVfRX/D0NURia31PsyiiVZLdAnGQzJQHXYXMuNXD16QBbpF0//VwTail3TIXlnUTtzBBk8vB6
 xRfi7FnjSprSzxzvmFDrtz68dPDQT14SarOK908nn9rheF63MwimzhYr6In177PsExUM8cB9m4Y
 yXluWfr5f/EGECN0dF6DPZYqps8ZW8ZJrTnxRTgMEiy87SHHxFPZucgmiKdnAYkeP7dv4BY+STs
 dPdHfvHSK9dKdZl2kyKzPJwwGhr5P6OeZncX7lj9SGSfSeZe+AmKL4uqHv9q+PK2pzZawEC52dJ
 svSpV1wO9m5nwNKn13F1ljhgYKY7tQRKyPZQluvH82WX4Zp//HGIBTt5AuKOFDaK5N31gpv7Dmz
 c2PimcSMqscOMYj6vjg==
X-Proofpoint-GUID: V_kbVWWdeLzcYx6xJ2-s_1ytwRpiJVLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260057

Changes in v4:
- First two patches merged
- Squashed previous #3 into next one (#4... but now it is patch #1),
  because: detection of root is still needed for DTS/DTSO with code:
  &soc {
	children ...
  };
  where comparing the c.parent.node_name to None or / would give false
  results of being child of root node.
  Fix regex pattern for "/{" case.
- Fix comments from Sashiko (rebasing issue, help msg, align continued
  values based on previous one ending with ',', do not report whitespace
  issues for comments)
- More test fixtures
- New patches:
  dtc: dt-check-style: Replace Test User email with Rob Herring
  dtc: dt-check-style: Call _strip_strings_and_comments() only once
- Link to v3: https://patch.msgid.link/20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com

Changes in v3:
- Responded to Sashiko and implemented its comments
- Properly handle root node with more than one space "/  {"
- Add more unit tests for DTSO whether properties and nodes are properly
  detected as top-level
- Link to v2: https://patch.msgid.link/20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com

Changes in v2:
- Trailing slash to maintainers path
- New patches:
   - Patch #9: dtc: dt-check-style: Add test for trailing white-space in DTS
   - Patch #10: dtc: dt-check-style: Add warning for redundant white-spaces
- Several fixes based on Sashiko's report (I responded to these on the
  lists)
   - _walk_bodies(): Fix setting up proper parent to each node after
     exiting node parsing. This wasn't working correctly.
   - check_child_name_order(): Properly sort top-level nodes by names,
     even if it comes with unit address like memory@1000
   - Add rest of property_bucket sorting for top-level properties,
     even though no properties are expected there, except few vendor
     ones
   - check_continuation_alignment(): Improve error msg for
     continuned-lines alignment warnings

- Link to v1: https://patch.msgid.link/20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com

Few improvements and proper handling of top-level node (name, not unit
address sorting) and property (model before compatible) sorting.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      dtc: dt-check-style: Replace Test User email with Rob Herring
      dtc: dt-check-style: Call _strip_strings_and_comments() only once
      dtc: dt-check-style: Add test for trailing white-space in DTS
      dtc: dt-check-style: Add warning for redundant white-spaces
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

 MAINTAINERS                                        |   2 +
 scripts/dtc/dt-check-style                         | 201 ++++++++++++++++-----
 .../bad/dts-child-name-order.dtso                  |  33 ++++
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  23 +++
 .../{good => bad}/dts-digit-node-order.dts         |  13 +-
 .../dts-digit-node-order.dtso}                     |  16 +-
 .../bad/dts-extend-node-child-name-order.dtso      |  26 +++
 .../bad/dts-extend-node-digit-node-order.dtso      |  34 ++++
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  21 +++
 .../dt-style-selftest/bad/dts-property-order.dts   |   7 +-
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../bad/dts-redundant-ws-strict.dts                |  27 +++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts |  27 +++
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 +++
 .../bad/yaml-child-addr-order.yaml                 |   2 +-
 .../bad/yaml-child-name-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   6 +-
 .../bad/yaml-digit-node-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   2 +-
 .../dt-style-selftest/bad/yaml-indent-strict.yaml  |   2 +-
 .../bad/yaml-label-in-string.yaml                  |   2 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   2 +-
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   2 +-
 .../dt-style-selftest/bad/yaml-multi-close.yaml    |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-node-close.yaml |   2 +-
 .../bad/yaml-prop-order-device-type.yaml           |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   2 +-
 .../dt-style-selftest/bad/yaml-prop-pairing.yaml   |   2 +-
 .../bad/yaml-redundant-ws-strict.yaml              |  31 ++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   |  34 ++++
 .../dt-style-selftest/bad/yaml-required-blank.yaml |   2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml    |   2 +-
 .../bad/yaml-trailing-comment.yaml                 |   2 +-
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   2 +-
 .../bad/yaml-unclosed-comment.yaml                 |   2 +-
 .../bad/yaml-unit-addr-prefix.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-unit-addr.yaml  |   2 +-
 .../dt-style-selftest/bad/yaml-unused-label.yaml   |   2 +-
 .../bad/yaml-value-ws-multiline.yaml               |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-value-ws.yaml   |   2 +-
 .../expected/dts-child-name-order.dts.txt          |   1 +
 .../expected/dts-child-name-order.dtso.txt         |   3 +
 .../expected/dts-cont-align.dts.txt                |   8 +
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../expected/dts-digit-node-order.dtso.txt         |   2 +
 .../dts-extend-node-child-name-order.dtso.txt      |   2 +
 .../dts-extend-node-digit-node-order.dtso.txt      |   2 +
 .../expected/dts-line-length.dts.txt               |   2 +
 .../expected/dts-property-order.dts.txt            |  13 +-
 .../expected/dts-property-order.dtso.txt           |   8 +
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 ++
 .../expected/dts-redundant-ws.dts.txt              |   9 +
 .../expected/dts-trailing-ws.dts.txt               |   2 +
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-redundant-ws-strict.yaml.txt     |   5 +
 .../expected/yaml-redundant-ws.yaml.txt            |   3 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dtso                 |  44 +++++
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  11 +-
 .../good/dts-digit-node-order.dts                  |   3 -
 ...it-node-order.dts => dts-digit-node-order.dtso} |  24 ++-
 .../good/dts-extend-node-child-name-order.dtso     |  26 +++
 .../good/dts-extend-node-digit-node-order.dtso     |  34 ++++
 .../dt-style-selftest/good/dts-property-order.dts  |   5 +
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../dtc/dt-style-selftest/good/yaml-4space.yaml    |   2 +-
 .../{bad => good}/yaml-cont-align.yaml             |  10 +-
 .../good/yaml-tricky-parsing.yaml                  |   2 +-
 scripts/dtc/dt-style-selftest/run.sh               |   2 +-
 71 files changed, 719 insertions(+), 117 deletions(-)
---
base-commit: 064561b5caa881c19a1917307a876d2ef8baa2fe
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

