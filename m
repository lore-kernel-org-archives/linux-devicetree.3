Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC216372071
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919717; cv=none; b=FPH5MLNB70fCWIK2TLeuuv3x3ezfSz3C+mrFY1tIxXCvLqr7oSNTbrSCANB7dEQVqZpLnG+QzIK5SRVhlfmNC+gPRI3CLHk2f7NnBmFdNhMULEehpAdNj9KyyNdKWnPk82nU5lmKzQbBlHjdQt1dTvLIZND5ZYE5LWzht30o42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919717; c=relaxed/simple;
	bh=rk7AYJ4z8OZ4DXkV/TJkDYgs4eUjZwOGhMCC9Zde4cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXKMJlOseC3n/Uk/8MxnT6CvkZRu66kokSp+2Pw6ZMRYrVrHXZOI+ggXFKnzJuOYQD5Ak/jmTt5RoQIc+MFUpFUuNn3heQlfu017aO4KxyFUVG3vOrSQCUZ77RvRKIE45q/XtWIAlXNjGb/4xxnP291AeWyLxra3SJ0TrMZCHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y83Lc6+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJeIT1wD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y83Lc6+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJeIT1wD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9TSH2993054
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 11:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c
	+YvvcoZY=; b=Y83Lc6+crTawKSpd2etjMcJNRajVj4+Yac7cWOogcgQen0oulHc
	LsD7wRpZzRUugCcYV0D8gJasLWEX66Md3XOqEICdSl8TtSjXzr72JFpTJ9KFMlSm
	3BshonKpTSHV7WluKI3w3svE8hccF5QOjvxGwp9kcKZ2m+wZGRwNt7iPvDTpYhci
	Tm7DPd8vykNEu3nN9kbJTAAYjv4ouL4HKCfnLcHLO8lXyQ8gsfamRN4OEa0zwQsd
	7ZZtS6XICy58vZpWhfhctlms9Jtoe94rJmPT1CdLmPYwYHvgilRRWvbu4Eg3sW4Z
	BrJAzSHpT0Z0EK/IrZ6UzJ8dAx1y76H3Ofw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8ehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:55:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so117161891cf.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780919713; x=1781524513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c+YvvcoZY=;
        b=gJeIT1wDk5xcTrlvA6uThEFLSY9ISsu2QaWc88Q3n98f6+d0JDj77P9eBV3FMMnqgB
         wmgnrn4+yx7XHdIX2/eJqO8i+9qlY2smncv4u6ORBuu+cVBC9R7C0ox5VetmV0N2KUCk
         pcri8/E1cDRrdf+jYTnCkvObkgwplI72zN5vHf9a+aGLDRqawy8qQk0BVbKcU8gbyhxb
         MO1iRnSdrD28qZhQFe6dyLhAkI5qYENaD56tX0RFKfwxv3qOMbV9O3JLh7mlB+MKiysb
         tqygJsPRM5xKQldrzMocbr+WYAA6dPqPDPl9BMuiMWYe9Uw1gDHMYVWPapQF9pj3/bQQ
         cFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919713; x=1781524513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c+YvvcoZY=;
        b=LK1lMOW/nfin2lx1CZj7mWVftLqyBHOJBsCQqzH+NKJSn5jJ1ppZx90NLiGkAyc7hh
         TYUWT0JkGt+In9D9EP6f4PwQvkedaYTqknGPnRoKZPpYBD8Gr1U9A5yxY7SJ3Glk8biF
         kIPRqt5Wy0i4AvQjxiDi0Xt8ylaL7kPi/7Acd6W4UeyZpKlPLpcGM95ioXar/IN+hhXr
         Tll/xaTsChq0ULVUMVgCtswOmB9ksNlwdWNxcOj22cxNRjMdLRWdrP6D8DILHNK8E/R/
         0JOCmseK6NEREe6SrHwvh9B+4n2siPrfphdC5Xzhs9aPG3RR4ly58kNmPSs51/353cLe
         ihew==
X-Forwarded-Encrypted: i=1; AFNElJ/myoeEQ+jLX2SVbqSRGCAS+PyKWUXBk4zi6hjPrL6k+0/OIy5v13nLpw2EVSq8m2QfVr2xGhuPsktB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OSxsBSTGxNDLXHyTroVakjc7GkNOxEWRgGpRYa1zTXGmUyPd
	9n7zP9P5qtc8GTB6SpSzHRUi2gqhM6+ZSI47dPVXIrAWT2mCjGZq0kV6NBFsHTTtaWC4ysZr+mY
	rl/Oa60me6WTBfYaMsQQCewUsN/GfFrhuMpxSqGTwCkkq7eU4wKtx11SRHlyf6zbd
X-Gm-Gg: Acq92OHyJFbiGuRcxtAEwCPgGk9eyerAdhOcs98MmVJTIvI9nk3Itm+oGL4hDJchfSO
	/rLTI+t4XVYFBFynYHPzWB/ye1HOYu9XnS/+bFy913qly9+eCjvVfBWSDPYbLeFGXP1xOU+QRon
	EZTc/P3/1e9VxCvOm/CLAw+7Sw3O4XmUhglj0aWDvGtHT4urfFxGLLPX+e94IP1ONpmNqc4SSRK
	88D3SKqBqfYwagqyCiZwblzGVBoaTlU8RFpUEEl7plznW8sWo5fq5amygoyCzMF9O8uDigk8qBf
	HsPqSiU+XbZZlXkd2g7GTAkn1odaf1DE6XCAn1awaa/plcs2nen8iYvQWK2ezACTNTCjePpksJQ
	KIjYYcGMgN/837F8hcSpZK9bj91vGH3QZEMB/LFuzwkFoNZI=
X-Received: by 2002:a05:622a:1f18:b0:517:9095:c31b with SMTP id d75a77b69052e-51795c919c1mr221598571cf.42.1780919712987;
        Mon, 08 Jun 2026 04:55:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:517:9095:c31b with SMTP id d75a77b69052e-51795c919c1mr221598051cf.42.1780919712549;
        Mon, 08 Jun 2026 04:55:12 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm410512245e9.12.2026.06.08.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:55:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: syscon: Revert renesas,r9a08g046-lvds-cmn
Date: Mon,  8 Jun 2026 13:55:08 +0200
Message-ID: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rk7AYJ4z8OZ4DXkV/TJkDYgs4eUjZwOGhMCC9Zde4cY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJq2b/orXa7P1gnWN7bZE7nNhm87KtXpyx54fv
 GLJTP2L4w+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiatmwAKCRDBN2bmhouD
 13ulD/wN+43ZlXwt2ZPjhQV1uAUL5/RvDGGAJakA0JCqB0mo4dXqj+qoi5FD+HzBXLGmk5p0gXJ
 keLmeTeLFGdbzDXngQIGKUMLzGY8K+8wSBuERdwdJ0FKqZbeQRL/awmUrimaWwgm075n/yDAreq
 uQ37NnXmii085pKK2iMDbkGiedAO9zYqqaiGQeReF2deRUnYR1JgIMHhKEzSfQaWF/McHV+HLyy
 TKt8eTvEy7JsfEpKFN7fgPq2h/griOu8KArg/Wl7PhqVY1pB+8Sl501URc/HapAgv5uX/GnFmGd
 n9jJ+BHVfKNaTh715kP8CZWdeWbpOJDaThSfQcjWMXzWUIdcUnJsrVLm9vyToMZgHw7SrZxeStN
 /r3mTvLK75XV4QUGPTg67WLK42uKbcNYSPoI0WBuTBY/EKPegAoIQEdc3dzbbxVlV3HMLTThIWX
 +M7LQ/N3+snLE+WiiLVZh5aVO+Elzk3JASjcbl8prcC2tpLw6ccHskBVBKqh6aq1gy1eA6dq9Kc
 i1sFgnaYy4IGr2G24gc83+3+qgsheLSLlb7A7W83DK28wsxGslv2j0HO7p2dwfvTFl3ZUIvdaOA
 /h8feBBDxzjT28FxCw3I0WNRafhAbRiMD85jpoz0zuYoSDbii0qkm0zuvk4a3lLeFMc36hau4pl FSS7CDzXe6AwIhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMiBTYWx0ZWRfX6XmXz56JP05H
 tE10kABwRCtTi2thSqyysq62dLhC9hjzgX/c2MoEvzNxi6wYNDRxRmdBTH2iLbv2/e3KJ4fYLyE
 q8aHagLsE0ekCRp1YXdMXcXRsnLsGJwIgousDEKwRuu1JgX5KgMExsGxbQCMY5MjHaFfLv31WrK
 mmYqUEZH1/YMWNkbZGeyXlUnGTTZrKMoEXuSM98laVbHlJu/op2EYwbR0r9hTJuoYT+bDpgkmuw
 n2ufgwHgMg8DqP/NBrn5dEy8OsSPTqOe/gRzigbo/WYXuAxONAgRYjjkok/e1YeqP9Ne9MwrhwE
 KsTy2j1z8SHJA61z49Aymdx665eyLuiLd2bME90izwXRxHelJB7wRfanFE5vF5rnd/2nzRQube1
 uB4PtG0WYAtBFmoZiRYn1YqWnwpifpADko85lXZNhs41L+yaz/SgieGZO5i6Ed01QRqdQI3MuRN
 oErU+GXCW6RbvLYkHuA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26ada2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=y6noWO0KkWWok_DAT-gA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: fNBYZIIt9SpybQzshX9GW5sZb-Rel3p4
X-Proofpoint-GUID: fNBYZIIt9SpybQzshX9GW5sZb-Rel3p4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080112

Revert commit 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the
LVDS_CMN syscon for the RZ/G3L") because it is completely not matching
reality and clearly incorrect in respect of renesas,r9a08g046-lvds-cmn.

It wasn't ever build-tested by author on their DTS, either.

The documented renesas,r9a08g046-lvds-cmn compatible clearly disallows
any children and simple-mfd fallback, however its only use in original
patchset is with simple-mfd and children, so this could have never
worked.

Fixes: 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..e22867088063 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -221,7 +221,6 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
-              - renesas,r9a08g046-lvds-cmn
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
-- 
2.53.0

