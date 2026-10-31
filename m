Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453008;
	b=z5CmWSudCmWujt/URcv1NdKKQ+H41k9wHfIg3VXRZ/6czzgPFIKhJpqLQCEjpAlPwoT4
	 aTDnkqEZnjEEsci8xKMMa2Hc7qYXb6krD6A9bAqRQ7eqHPhtsMI1MEf6oUM16eo7fb2pZ
	 oXUvuFbXnzpkCVbDvuCPP7LT18U7OeVoc7PUCWShVEIJ61KuFzURizXaKMbjbfxlKxzQl
	 Arpme2gC3Dbq1EiQH6SAWHMCHF4Tzgj6FUd/qakb9q4zPtslIOWzP4yhxThJKboLIY3AQ
	 Y6vVrB35zJu0oQ8AnjHxAJr+9cYoW7Z9RQQ3+ItuW7gIyYvsenXGJ0A2NOBP+C+9Fjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FTlxMjnJ9grJ39wAfylJUBTJSfWzAKcVIkKO9D0XngI=;
	b=l49wpk25kdXv5SlrVnO3NefTjlOj13WgAd8c1c4XDXjKU5cFdvc3DXKR33xdrohV8Qkp
	 aEKyTixS7tC5/W3zqcrTVppHc9ycUs+mr/j5wDx37Cc7VD9NEgU3sQR9YaRfM8rn92LC+
	 lHKiPZFuh8s1k/bLWfcx5ohyxd7PLTpBQIYkNFNNrKrw8vu7yWPKecN80UE28ePnKIY3x
	 M9JvPz96mnxucvp8ZrxTjBa+W6hbwQsj2NOC5ibE859bxwsPaSh2sImH27EvAlFOPbfHi
	 yXgORGnr1MybjBcJn7sfMWEiEo1VHcODFoUt4429EymJI1rnqPTYROzG11dPGz6/Jkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmecC96w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWviRtPl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C73606A324
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C73606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmecC96w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWviRtPl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02pQ3174201
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTlxMjnJ9grJ39wAfylJUBTJSfWzAKcVIkKO9D0XngI=; b=SmecC96w0L0TzrAz
	pJLOlR50EKJ99cTYeP2fJhSGVmWuTzegOZe4oP6rmTOqrN3IiZ4MjXwdHlnGcjsT
	nclz/ng/jjaBSTyiUezqotKlQ5naaoAZ8Go39/59jAwCmf6VN5W71d6Ojtcle4su
	g5YWaRFhtpKl7EfCXPR1v6QHk7sLqaDFzokJEh695oKW+SF18fXKqPrP+J2F9T7Z
	RjJE5vLh9BZSXLQlU5nPHCR+PSJzn9OeW9H3SPVLxsZgAjZPSgxikYADv3BxjavJ
	tcnP30fTq1Ew9oxyzQuxtmVGlUtMzHDr4KZtty2+aMaI3DhqpBm7QuppT51/Ruwl
	9q7hSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsg3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so2718223eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453006; x=1794057806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTlxMjnJ9grJ39wAfylJUBTJSfWzAKcVIkKO9D0XngI=;
        b=CWviRtPlNeObYAYNQ62qfd4LAFn4y16AtkOGhecif6H7nqztUFu7+6XTzvnZDpmPmI
         ASUJ+ov613/llIeP0xsgKbCmLTYJtMaH4db0wtqMP0N1KcopOIcvgEOCy5jaOeXpPvnG
         X7N6TnWWN1wo1qCpnAAcy34Fdhqj5j2aZ+jBGtyQA5IzRIyICJnncnCxhJzqOMqUImoi
         zHNJT7P2+mqZFW4gxNMdVc5n7sh0oR5nXDH+snCIv0fOCq1CjULeVtiGLciS4HwOHtF/
         jPnAJfAvQos8z3GFJ7g4aAThqtcGxp2mfOL/xU1c4gsxoKy3naCb98BHR1FAHBLoqvDF
         wgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453006; x=1794057806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTlxMjnJ9grJ39wAfylJUBTJSfWzAKcVIkKO9D0XngI=;
        b=yHUSuv8ymQ+N1yvVlRQ0TSroMlhy0jZWQX3N8oB637WSOctbr853oUCh5Tj+BqvKef
         1X66Xr666wAS/9ky0yNvT55he9gvxq8fuZe709X4Ucwviwil/FXwgwNEarTiCcQqsBI2
         gdetejeo+lhVsk+isCv1y1oPjYo8tS4+7GH3vpsIBZVgSgYw7Bu9wL0sGoDNgrPB33jT
         8MI5r7EnFcvBn9mLXWvBouOJwazZ89QtKDEVbUU15HHIzY+bE0nHNQOG9xw5vffkJtXg
         8R+xYYoQeMyU+73GTYvhlOJASM6sOG5887Sv4OBuLfGmwtuEJYBkoO5fKTcbL58gh5Ww
         8nKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUmkNNLwfz5HQ/oc+6wGlbm5stQCE5yzyYe7kEjj1oPy6ZEgUYrX1vzXaydXy+7/FYQWb7EOfg9JzC@vger.kernel.org
X-Gm-Message-State: AFq9FYLwAujqbIA5GXUV6tjYnmJiPqrp8Ty8V7/+4+NfG0CrTsvC2b5A
	4UYC+nDtG0l3Iso7YaitlnIAMVbZ0/NWDa1FU9hgnJkE/RFLzQYnsah3Oc0w19zFm5KoE5LQ696
	x9Yh4zhSlR0ZQYXOeH8wK1J4hQEJ1JihIgpa6qH7CSJZDheiK8AlIuesZPvN0fpn/
X-Gm-Gg: AYBFou10u6HkFki+kHxbnmbkCZ+VJ3Vw/S2w4AWVqNF7dacpnOQoYd2Y0CEoApQQmu8
	M8+JiZ8P2stEs7zAxzCrfUOXpmk5LsvOnIJ/FKkI9EnfwllzELWHkqL6Uk5ZXXqIUGnvnu0F05q
	DhLcKhPvoe6niRDD/INUpoxEEw75cWrjX6y/gK1GO+gLqrtHrwgzcoeKulNuZbokmi6xh1dAyb7
	cCtW9O78bl6/F8hviHd5Bmmv5WHZarqWGGRPqqg6hJJr/6Dh2R3+54F0UmpgimgibGfrSAcPfYq
	tnrPiB30bdPOOeUqC4T3WddKWyPqC5/Pma40zDzHopV9lxPAJEyK2GinBwXhSX3cCNv0FRsXW94
	C6hTbW3DHlN3aNcjUTP1Q/fa6nD+8JWd3CLcATHkBxF7HOQcFzXjgVDttQPL7oHCYGbppYNETyh
	SBSlE=
X-Received: by 2002:a05:7022:92b:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1ac5bda7dd8mr9418561c88.8.1793453005365;
        Sat, 31 Oct 2026 06:23:25 -0700 (PDT)
X-Received: by 2002:a05:7022:92b:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1ac5bda7dd8mr9418473c88.8.1793453004461;
        Sat, 31 Oct 2026 06:23:24 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:24 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:48 +0530
Subject: [PATCH v2 2/6] thermal: add hardware-binning trip-point filtering
 support
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
Message-Id: <20261031-thermal_bin-v2-2-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=21634;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=4GQMlt3kN0303+k4mKsOBx3Wa61YwirAee/NxKihTqo=;
 b=5hd6IIdnkIP36ukojRAcM9u1nWuJ2d6WHjkGvbEFWiOphqy0LLRr7ZCLMsx+e7AMKTWyAoZPW
 dhdJEthPr6hBWLU6bLr4rITuZxbzLU2ZMLUXVom9gwPrtC/EZJEGHRX
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX8JuGDqAVJwGQ
 9RbodkhQ2AKizgYnW6qNR62Qcc6KNEwdVpYaNObZrPjRE9ZPhyb16IOhpGU/kqBSEL+6tSQsA7H
 gaWHr0fj+8fWQVrkz3WmRaV+sMgl1go=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5ebce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B0hz1L2w7P3HlZecjf4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RTawRGjAd3ybVxXOY4-39xvBTV03Pvy7
X-Proofpoint-ORIG-GUID: RTawRGjAd3ybVxXOY4-39xvBTV03Pvy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX8ycBStlj+Gsj
 Xot5VswxwUtRN8XGt8/TwfAAwfKbaEcGWH0G+Nl86TfS7n0P0Bgo8vKRexRfIHT6MfXR+w6/fsM
 AXl1V85T30owjBovJyBOUIhkX11hIvqmoYoAXmtVMfP2Mr2w0GoCOY3FGMVXQMZ/HXykWe5bV/V
 /7nz8NVyk2hD0N1gLkn2Bf8IR+V3H8zmbChqPVHjy8jfTrag3CIHq/f5qpR2awkixOUODqzsugV
 12Ksx4dOVzJN30puh9MMwl7iw7ZnBCpgCHeLKlVyU/kcQ2ZkkL2LpL4bWj+PO94hRuvAItvt3cL
 wA8orC2i6vwkA0yFYP3H7Dcqz1OifllLBYufZl4c3+C5tX2OC63q203HUjMjdrgskbhJUhIfKb7
 hRgqI+KNtHyvy3qMPC59tgGDhtMPO6hhgAAhYeMGp/B/JFa4Yxi29HdGZjJ/nVqfVqFBpWLfRZd
 dO9skrnTq6+6M0Y7haA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

Differences in SoC packaging can be used to provide multiple SoC SKUs at
different thermal and performance characteristics. The underlying SoC
remains the same except for how much heat the packaging can dissipate,
thereby influencing what is the critical trip point at which the SoC SKU
needs to be throttled. This is the basis for thermal-binning.

This SKU-specific data is typically burned into EFUSEs during
manufacturing. We can read back this information at runtime to populate
the appropriate trip points applicable to an SKU.

Linux support for this has been modeled along the lines of the
opp-supported-hw property in the OPP framework that already allows
similar mechanisms to allow/disallow certain operating frequencies for
the processor. The thermal-hw-bin property allows multiple SKUs of an
SoC to be configured for different critical trip points based on a fuse
mask.

Add thermal OF support to parse the thermal-hw-bin and temperature-bin
DT properties. Platform sensor drivers pass decoded hardware-version
information to devm_thermal_of_zone_register_with_bin() before trip
points are parsed, allowing the OF parser to filter trips and select
per-bin temperatures during zone registration.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../driver-api/thermal/hardware-binning.rst        | 112 +++++++++
 Documentation/driver-api/thermal/index.rst         |   1 +
 MAINTAINERS                                        |   1 +
 drivers/thermal/thermal_of.c                       | 253 +++++++++++++++++++--
 include/linux/thermal.h                            |  32 +++
 5 files changed, 377 insertions(+), 22 deletions(-)

diff --git a/Documentation/driver-api/thermal/hardware-binning.rst b/Documentation/driver-api/thermal/hardware-binning.rst
new file mode 100644
index 000000000000..c385a2e224e3
--- /dev/null
+++ b/Documentation/driver-api/thermal/hardware-binning.rst
@@ -0,0 +1,112 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+Thermal hardware bins
+=====================
+
+:Author: Amit Kucheria
+
+Overview
+========
+
+Differences in SoC packaging let a vendor ship several SKUs built from the
+same silicon but with different thermal characteristics.  Better packaging
+dissipates more heat, so the temperature at which a SKU must be throttled (or
+shut down) differs between SKUs.  This SKU-specific information is typically
+burned into eFUSEs during manufacturing and can be read back at runtime.
+
+Thermal "hardware binning" lets a single device tree describe the trip points
+for every SKU of an SoC and have the kernel pick the values that match the
+silicon it is actually running on.  The mechanism is modelled on the
+``opp-supported-hw`` property used by the OPP framework: the platform supplies
+one or more 32-bit hardware-version words decoded from fuses, and each trip
+point declares the hardware bitmasks for which it is valid.
+
+Hardware-bin trip parsing is part of the thermal OF helpers.
+
+Device tree properties
+=======================
+
+Two properties are added to a trip-point node (see
+``Documentation/devicetree/bindings/thermal/thermal-zones.yaml`` for the
+authoritative schema):
+
+``temperature-bin``
+  An array of trip temperatures in millicelsius, one entry per
+  ``thermal-hw-bin`` sub-group.  It is used *instead of* the plain
+  ``temperature`` property when the trip temperature depends on the hardware
+  bin.  Exactly one of ``temperature`` or ``temperature-bin`` must be present
+  in a trip node.
+
+``thermal-hw-bin``
+  One or more groups of N 32-bit masks describing the hardware revisions for
+  which the trip point is valid, where N is the number of hardware-version
+  words supplied by the platform (``supported_hw_bin_count``, see below).  The
+  format and semantics match ``opp-supported-hw``: a sub-group matches when,
+  for every word ``i`` in ``[0 .. N-1]``, the bitwise AND of the ``i``-th mask
+  and the ``i``-th platform hardware value is non-zero.  The trip is enabled if
+  any sub-group matches.  When paired with ``temperature-bin`` the number of
+  sub-groups must equal the number of ``temperature-bin`` entries, and the
+  matching sub-group selects which ``temperature-bin`` entry is used.  When
+  ``temperature-bin`` is present, ``thermal-hw-bin`` is required.
+
+Example::
+
+    trips {
+        cpu-critical {
+            /* bin 0 throttles at 95C, bin 1 at 105C */
+            temperature-bin = <95000 105000>;
+            thermal-hw-bin = <0x1>, <0x2>;
+            hysteresis = <1000>;
+            type = "critical";
+        };
+    };
+
+Here the platform registers a single hardware-version word (N = 1).  If that
+word ANDed with ``0x1`` is non-zero, the first sub-group matches and the trip
+uses 95000 mC; if it ANDed with ``0x2`` is non-zero, the second sub-group
+matches and the trip uses 105000 mC.  If neither matches the trip is skipped.
+
+Platform driver API
+===================
+
+A platform driver decodes the SoC fuses into hardware-version words and hands
+them to the thermal core, which makes them available to the OF trip parser.
+The words are carried in ``struct thermal_hw_bin_info``::
+
+    struct thermal_hw_bin_info {
+            const u32       *supported_hw_bin;
+            unsigned int     supported_hw_bin_count;
+    };
+
+``supported_hw_bin``
+  Array of N bitfields identifying the running hardware version.
+
+``supported_hw_bin_count``
+  Number of valid entries in ``supported_hw_bin`` (the N above).  Must be in
+  the range ``1 .. THERMAL_HW_BIN_MAX_LEVELS``.
+
+Pass a filled ``struct thermal_hw_bin_info`` to
+``devm_thermal_of_zone_register_with_bin()`` when registering the thermal zone.
+The hardware-version information must be available at registration time because
+the OF trip points are parsed synchronously during zone registration::
+
+    struct thermal_zone_device *
+    devm_thermal_of_zone_register_with_bin(struct device *dev, int id,
+                                           void *data,
+                                           const struct thermal_zone_device_ops *ops,
+                                           const struct thermal_hw_bin_info *hw_bin_info);
+
+The caller owns the storage referenced by ``hw_bin_info``.  It only needs to
+remain valid for the duration of ``devm_thermal_of_zone_register_with_bin()``,
+because the OF parser consumes the values before the function returns.
+
+If a trip uses ``temperature-bin`` but no bin info has been provided for the
+zone, the core cannot select an entry; it warns once and falls back to the
+first ``temperature-bin`` value.  Platform drivers should therefore provide
+the bin info before the zone's trips are parsed.
+
+The Qualcomm tsens driver is the reference user: it reads the named nvmem
+cells described by a per-SoC ``struct tsens_hw_bin_desc``, converts the raw
+fuse values into hardware-version words, and passes the result to
+``devm_thermal_of_zone_register_with_bin()``.
diff --git a/Documentation/driver-api/thermal/index.rst b/Documentation/driver-api/thermal/index.rst
index a886028014ab..5f858fabc865 100644
--- a/Documentation/driver-api/thermal/index.rst
+++ b/Documentation/driver-api/thermal/index.rst
@@ -11,6 +11,7 @@ Thermal
    cpu-idle-cooling
    sysfs-api
    power_allocator
+   hardware-binning
 
    exynos_thermal
    exynos_thermal_emulation
diff --git a/MAINTAINERS b/MAINTAINERS
index 6e50747a621c..d99605b8b54c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27343,6 +27343,7 @@ F:	Documentation/ABI/testing/sysfs-class-thermal
 F:	Documentation/admin-guide/thermal/
 F:	Documentation/devicetree/bindings/thermal/
 F:	Documentation/driver-api/thermal/
+F:	Documentation/driver-api/thermal/hardware-binning.rst
 F:	drivers/thermal/
 F:	include/dt-bindings/thermal/
 F:	include/linux/cpu_cooling.h
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index fe47d74b7219..c5ec7d2a38ca 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -60,18 +60,165 @@ static int thermal_of_get_trip_type(struct device_node *np,
 	return -ENODEV;
 }
 
+/*
+ * thermal_of_match_hw_bin_group - test one thermal-hw-bin sub-group
+ * @np:     device node containing the property
+ * @hw:     hardware binning info (must be non-NULL)
+ * @levels: number of words per sub-group, equal to hw->supported_hw_bin_count
+ * @group:  sub-group index to test
+ *
+ * Returns true if every word in sub-group @group has a non-zero bitwise
+ * AND with the corresponding hw->supported_hw_bin[] entry.  The caller is
+ * responsible for ensuring @group < total-cells / @levels.
+ */
+static bool thermal_of_match_hw_bin_group(struct device_node *np,
+					  const struct thermal_hw_bin_info *hw,
+					  unsigned int levels, unsigned int group)
+{
+	unsigned int j;
+	u32 val;
+
+	for (j = 0; j < levels; j++) {
+		if (of_property_read_u32_index(np, "thermal-hw-bin",
+					       group * levels + j, &val))
+			return false;
+		if (!(val & hw->supported_hw_bin[j]))
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * thermal_of_trip_is_supported - check if a trip node is valid for this hardware
+ * @np:  device node for the trip point
+ * @hw:  hardware binning info (may be NULL)
+ *
+ * If @hw is NULL or the trip node has no thermal-hw-bin property, the trip is
+ * considered valid for all hardware.  Otherwise, the property is read as groups
+ * of hw->supported_hw_bin_count 32-bit masks; the trip is valid if any group
+ * matches (bitwise AND non-zero for every word in the group).
+ *
+ * Return: true if the trip is valid for the running hardware, false otherwise.
+ */
+static bool thermal_of_trip_is_supported(struct device_node *np,
+					 const struct thermal_hw_bin_info *hw)
+{
+	unsigned int levels, ngroups, i;
+	int count;
+
+	if (!hw)
+		return true;
+
+	levels = hw->supported_hw_bin_count;
+
+	count = of_property_count_u32_elems(np, "thermal-hw-bin");
+	if (count == -EINVAL)
+		return true;
+	if (count < 0) {
+		pr_warn_once("%pOF: error reading thermal-hw-bin: %d\n", np, count);
+		return false;
+	}
+	if (count == 0)
+		return true;
+
+	if (count % levels) {
+		pr_warn("%pOF: thermal-hw-bin length %d not a multiple of supported_hw_bin_count %u; disabling trip\n",
+			np, count, levels);
+		return false;
+	}
+
+	ngroups = count / levels;
+	for (i = 0; i < ngroups; i++)
+		if (thermal_of_match_hw_bin_group(np, hw, levels, i))
+			return true;
+
+	return false;
+}
+
+/**
+ * thermal_of_trip_read_temperature - read trip temperature, with bin support
+ * @np:   device node for the trip point
+ * @hw:   hardware binning info (may be NULL)
+ * @temp: output temperature in millicelsius
+ *
+ * Tries the scalar 'temperature' property first.  If absent, falls back to
+ * 'temperature-bin', selecting the entry whose corresponding thermal-hw-bin
+ * sub-group matches the running hardware.  Returns -ENODEV if temperature-bin
+ * is present but no sub-group matches (caller should skip this trip).
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int thermal_of_trip_read_temperature(struct device_node *np,
+					    const struct thermal_hw_bin_info *hw,
+					    s32 *temp)
+{
+	unsigned int levels, ngroups, i;
+	int count_hw, count_temp;
+	s32 t;
+
+	if (!of_property_read_s32(np, "temperature", &t)) {
+		*temp = t;
+		return 0;
+	}
+
+	count_temp = of_property_count_elems_of_size(np, "temperature-bin",
+						     sizeof(u32));
+	if (count_temp < 0)
+		return -EINVAL;
+
+	if (!hw) {
+		u32 utmp;
+
+		pr_warn("%pOF: temperature-bin requires platform hw binning info; using first entry\n",
+			np);
+		if (of_property_read_u32_index(np, "temperature-bin", 0, &utmp))
+			return -EINVAL;
+		*temp = (s32)utmp;
+		return 0;
+	}
+
+	levels = hw->supported_hw_bin_count;
+	count_hw = of_property_count_u32_elems(np, "thermal-hw-bin");
+	if (count_hw <= 0 || count_hw % levels)
+		return -EINVAL;
+
+	ngroups = count_hw / levels;
+	if (count_temp != (int)ngroups)
+		return -EINVAL;
+
+	for (i = 0; i < ngroups; i++) {
+		if (thermal_of_match_hw_bin_group(np, hw, levels, i)) {
+			u32 utmp;
+
+			if (of_property_read_u32_index(np, "temperature-bin",
+						       i, &utmp))
+				return -EINVAL;
+			*temp = (s32)utmp;
+			return 0;
+		}
+	}
+
+	pr_warn("%pOF: no thermal-hw-bin sub-group matched for temperature-bin\n", np);
+	return -ENODEV;
+}
+
 static int thermal_of_populate_trip(struct device_node *np,
-				    struct thermal_trip *trip)
+				    struct thermal_trip *trip,
+				    const struct thermal_hw_bin_info *hw)
 {
 	u32 hysteresis;
 	s32 temperature;
 	int ret;
 
-	ret = of_property_read_s32(np, "temperature", &temperature);
-	if (ret < 0) {
-		pr_err("missing temperature property\n");
-		return ret;
+	if (!thermal_of_trip_is_supported(np, hw)) {
+		pr_debug("%pOF: trip skipped: no thermal-hw-bin match\n", np);
+		return -ENODEV;
 	}
+
+	ret = thermal_of_trip_read_temperature(np, hw, &temperature);
+	if (ret)
+		return ret;
 	trip->temperature = temperature;
 
 	ret = of_property_read_u32(np, "hysteresis", &hysteresis);
@@ -94,7 +241,9 @@ static int thermal_of_populate_trip(struct device_node *np,
 	return 0;
 }
 
-static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
+static struct thermal_trip *thermal_of_trips_init(struct device_node *np,
+						  int *ntrips,
+						  const struct thermal_hw_bin_info *hw)
 {
 	int ret, count;
 
@@ -114,9 +263,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 	count = 0;
 	for_each_child_of_node_scoped(trips, trip) {
-		ret = thermal_of_populate_trip(trip, &tt[count++]);
+		ret = thermal_of_populate_trip(trip, &tt[count], hw);
+		if (ret == -ENODEV)
+			continue;
 		if (ret)
 			return ERR_PTR(ret);
+		count++;
 	}
 
 	*ntrips = count;
@@ -364,27 +516,24 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
 }
 
 /**
- * thermal_of_zone_register - Register a thermal zone with device node
- * sensor
- *
- * The thermal_of_zone_register() parses a device tree given a device
- * node sensor and identifier. It searches for the thermal zone
- * associated to the couple sensor/id and retrieves all the thermal
- * zone properties and registers new thermal zone with those
- * properties.
+ * thermal_of_zone_register_with_bin - Register a thermal zone with device node
+ * sensor and optional hardware binning info
  *
- * @sensor: A device node pointer corresponding to the sensor in the device tree
- * @id: An integer as sensor identifier
- * @data: A private data to be stored in the thermal zone dedicated private area
- * @ops: A set of thermal sensor ops
+ * @sensor:   A device node pointer corresponding to the sensor in the device tree
+ * @id:       An integer as sensor identifier
+ * @data:     A private data to be stored in the thermal zone dedicated private area
+ * @ops:      A set of thermal sensor ops
+ * @hw_bin_info: Optional hardware binning info for trip filtering (may be NULL)
  *
  * Return: a valid thermal zone structure pointer on success.
  *	- EINVAL: if the device tree thermal description is malformed
  *	- ENOMEM: if one structure can not be allocated
  *	- Other negative errors are returned by the underlying called functions
  */
-static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
-							    const struct thermal_zone_device_ops *ops)
+static struct thermal_zone_device *
+thermal_of_zone_register_with_bin(struct device_node *sensor, int id, void *data,
+				  const struct thermal_zone_device_ops *ops,
+				  const struct thermal_hw_bin_info *hw_bin_info)
 {
 	struct thermal_zone_device_ops of_ops = *ops;
 	struct thermal_zone_device *tz;
@@ -403,7 +552,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 		return ERR_CAST(np);
 	}
 
-	trips = thermal_of_trips_init(np, &ntrips);
+	trips = thermal_of_trips_init(np, &ntrips, hw_bin_info);
 	if (IS_ERR(trips)) {
 		pr_err("Failed to parse trip points for %pOFP id=%d\n", sensor, id);
 		ret = PTR_ERR(trips);
@@ -461,6 +610,26 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 	return ERR_PTR(ret);
 }
 
+/**
+ * thermal_of_zone_register - Register a thermal zone with device node sensor
+ *
+ * @sensor: A device node pointer corresponding to the sensor in the device tree
+ * @id:     An integer as sensor identifier
+ * @data:   A private data to be stored in the thermal zone dedicated private area
+ * @ops:    A set of thermal sensor ops
+ *
+ * Return: a valid thermal zone structure pointer on success.
+ *	- EINVAL: if the device tree thermal description is malformed
+ *	- ENOMEM: if one structure can not be allocated
+ *	- Other negative errors are returned by the underlying called functions
+ */
+static struct thermal_zone_device *
+thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+			 const struct thermal_zone_device_ops *ops)
+{
+	return thermal_of_zone_register_with_bin(sensor, id, data, ops, NULL);
+}
+
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
 {
 	thermal_of_zone_unregister(*(struct thermal_zone_device **)res);
@@ -510,6 +679,46 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register);
 
+/**
+ * devm_thermal_of_zone_register_with_bin - register a thermal zone with hardware binning info
+ *
+ * Like devm_thermal_of_zone_register(), but passes @hw_bin_info to the trip-point
+ * parser so that trips can be filtered and per-bin temperatures selected at
+ * zone registration time.  Use this when fuse values are read before zone
+ * registration (e.g. in a platform driver's probe function).
+ *
+ * @dev:         device structure pointer to sensor
+ * @id:          the sensor identifier
+ * @data:        private data stored in the thermal zone 'devdata' field
+ * @ops:         ops structure associated with the sensor
+ * @hw_bin_info: hardware binning info for trip filtering (may be NULL)
+ */
+struct thermal_zone_device *
+devm_thermal_of_zone_register_with_bin(struct device *dev, int id, void *data,
+				       const struct thermal_zone_device_ops *ops,
+				       const struct thermal_hw_bin_info *hw_bin_info)
+{
+	struct thermal_zone_device **ptr, *tzd;
+
+	ptr = devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	tzd = thermal_of_zone_register_with_bin(dev->of_node, id, data,
+						ops, hw_bin_info);
+	if (IS_ERR(tzd)) {
+		devres_free(ptr);
+		return tzd;
+	}
+
+	*ptr = tzd;
+	devres_add(dev, ptr);
+
+	return tzd;
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register_with_bin);
+
 /**
  * devm_thermal_of_zone_unregister - Resource managed version of
  *				thermal_of_zone_unregister().
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 306ad17aed89..e9e4b2dc2824 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -86,6 +86,23 @@ struct thermal_trip {
 #define THERMAL_TRIP_PRIV_TO_INT(_val_)	(uintptr_t)(_val_)
 #define THERMAL_INT_TO_TRIP_PRIV(_val_)	(void *)(uintptr_t)(_val_)
 
+/* Matches the maxItems: 4 constraint on the thermal-hw-bin binding. */
+#define THERMAL_HW_BIN_MAX_LEVELS	4
+
+/**
+ * struct thermal_hw_bin_info - platform-specific hardware binning description
+ * @supported_hw_bin: array of bitfields identifying the running hardware version
+ * @supported_hw_bin_count: number of valid entries in @supported_hw_bin
+ *
+ * Filled by platform code that decodes SoC revision / fuse information.
+ * Shared with the thermal OF parser to filter trip points and select
+ * per-bin temperatures via the thermal-hw-bin / temperature-bin DT properties.
+ */
+struct thermal_hw_bin_info {
+	const u32	*supported_hw_bin;
+	unsigned int	 supported_hw_bin_count;
+};
+
 struct cooling_spec {
 	unsigned long upper;	/* Highest cooling state  */
 	unsigned long lower;	/* Lowest cooling state  */
@@ -216,6 +233,12 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      struct device_node *np,
 					      const char *type, void *devdata,
 					      const struct thermal_cooling_device_ops *ops);
+
+struct thermal_zone_device *
+devm_thermal_of_zone_register_with_bin(struct device *dev, int id, void *data,
+				       const struct thermal_zone_device_ops *ops,
+				       const struct thermal_hw_bin_info *hw_bin_info);
+
 #else
 
 static inline
@@ -254,6 +277,15 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct thermal_zone_device *
+devm_thermal_of_zone_register_with_bin(struct device *dev, int id, void *data,
+				       const struct thermal_zone_device_ops *ops,
+				       const struct thermal_hw_bin_info *hw_bin_info)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 #endif
 
 int for_each_thermal_trip(struct thermal_zone_device *tz,

-- 
2.34.1

