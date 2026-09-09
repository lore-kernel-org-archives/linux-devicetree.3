Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBB55D88D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959458; cv=none; b=myCWRGROWJ/7M2j7kvMlbZupU0BrM/Im8CC6j0N0hj0Y/uLzJNFthC/0LTQmX0xJvwnX6hijLPHQnYOXtP7qRFInWeMLarR1zrPRbWaP0sm0wqe8v3vxf7tBkBNGHdkCw5WScqaz3J8i1f+/vwcxsLWJV7IEzlTNLKbQ+Eibr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959458; c=relaxed/simple;
	bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hi26rfPZ4PbcMrSN+3iz3sgAXI6z7R+AwxvJ0oY6ZYJGGzpvlDKTAJqR7v6a4ELmrdfw46pgJeaQKG2ihbDhnReNBz/JFgbB4KsC4sBTYRDHi6LEgG8ACjmWwLDSFc70cFZPfUho9fYdShu/L3dxBVA5GMF/jDR2uxztq6JrMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAtkTypM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5Lrg2zP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAtkTypM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5Lrg2zP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUOIV600638
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=; b=DAtkTypMn04wZ1TP
	WbSui06HmTW3UHNwKc5XLh+GWQiORuQHKnyGnJZyR4d1DQ1IQD9KHBu3EgO/iPeG
	dYpjgeBb9fRBhgAbKd9a6+U9AHP6bKBHgzs/qurmuXwQ9GrlUDQG+GK9atA8Sfim
	rxUaDzz8L58Nlptu1RVcPHSLa+sJnBrz2o+zuj5foYpstr4kVNJad3FB6vxAmNPA
	2+fglSMQUp1L/3ypBIiOql4fNQAOFChaNM9YqsQSl7Ht/uSZJ3/V0fa069EObEU7
	Dg7RU8QXYi8rNnXyMidz0x3QM6j8RHG6Pq9ANbaCFa5+GeAI6AuVuUC7DlqJkNmd
	sPd1yQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr22pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:10:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a5a291af3so4238992137.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959454; x=1789564254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=i5Lrg2zPONW8/GMdOzMkfC2l34H/Iwe9y6ivEj69gE8lMv/aZAuOO4SK20Ug/toS9z
         xO+mwC1lU1MKGLV48m0SjjAiK2n5yVLFqy+xItxZmz388kAl87HlAFBYpzm+ZigQJTC/
         KuUFI9LgbIAs0pInJCxfrtoonlcX93Q28TZ609ngY5u24e8FSNIrawXKNCSSY1rQjOpZ
         CBXNB8ynRkiqo5grwOiT5nr/ExVwCZh5kp+3kN4SRyvFIgiiiFDNeDWlgM/4O4O5uTGJ
         fIFEnUPlap6cZEBrl9nvJ5FHkLSmmVp+jmmfi8aGdi8NWr1Colne6XnqSJxrPJ7j+V/Y
         AAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959454; x=1789564254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiS2pGqIFKAf7u+eYdTRDO4CKrAlgaifUWeuWMxg02s=;
        b=VuyAINt39C2GFCbUS4hE2eICTretjdFHsYKdleZkmPJKNO73XzUjFpAkiL29crBtvm
         qpAdBin6ki/3LjDGUTnhK+Uv26djsQ5C73sh/xukDnyjn4zhQ/BSoPX/3EKQiyQPgKO1
         5M9snHds82VtPDbop9WqHpnAZ6UypfLEO/GttQzcdpURb5HMdEgT1fK4z6dDTpP/Qd11
         oKpIFIN/9P8R1JLdJNAWqU1zCXjY8ckXyWD9xXOG4AZO+R1xBFgqidzeWfDTe4vBS3Uq
         oWG+tkcfO/tK2qDxVoLpBmK6jfmVHJ2Ceyvjs1j712a5Rr3yog3e53shUkjc7q/GBtoI
         aEyA==
X-Gm-Message-State: AFuF++mwT5sBUey81NMnau2DMZE0dSgt9wp+4BmGuIpDFxHgaXIcV61m
	oCupi0TuXjIWNvh8IF5B5myBoRNIdvuWTO4YLbw6cCCKMUsiEsFDt5Ow8ezw+9GU+xP5lHkmuo2
	rbYCgsWGtTmXHFzkIt7+udqwzIQWlkTTdu2bw1KYw93/VE1UbCSn3IKUpxGdprhry
X-Gm-Gg: AYBFou2WcndH+OC4BklKthF70EFxNZu7AseNpdbKxuFNhemBFD+htI5VVMqoEQAoIAB
	ie6eHTrFv7H6vjTspbq7AgXeanfxvDW4qYdoxSZ1ycATXF9BkX7LkwLBgtry1gXvgF9rbZcsLcy
	/jcWHH+LLazmZQUZeeCuW1LaEA88GRrE54EjO4OhKhTq8lVzLLbkG8rMVStDu5S1Ro3CeIPp4wx
	j7hSi37Q9HzkYtyp9zldXuUSK9wQktb602+Q841CzegvO1U5RbhyQok+tXXCFtQD3FVHbS0scs2
	y4aCYHcr58kB8IZZGx/1Q8WEaq6M7Q3FJnm7Cd3V9LemwuBCm0bF1mMKTrDEF8Opi8msa7Le8SU
	MR7cUGUowkmi7Xq/pYbmwLnw=
X-Received: by 2002:a05:6102:5e8a:b0:785:eb33:87af with SMTP id ada2fe7eead31-79078210c3amr485361137.10.1788959454510;
        Wed, 09 Sep 2026 06:10:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8a:b0:785:eb33:87af with SMTP id ada2fe7eead31-79078210c3amr485329137.10.1788959454022;
        Wed, 09 Sep 2026 06:10:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:36 +0200
Subject: [PATCH v3 2/7] dtc: dt-check-style: Handle continued lines in
 check_line_length()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-2-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ixb/AmdAstOcn9FVhgNt2Xll/IdUyQ44GvDHEBU3aaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrP3y44K/5QKTimSkeef6hsl1b6Ri9MoiD0+
 GTehlOA5mCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFazwAKCRDBN2bmhouD
 10qdD/9/+rRPDUfbCB9PEoX6U2Fy8f4AOv+aXooPfKpn1TL9qMi2cQq2aJpiA+OScLO+uyCl9Gm
 R7CyaMslr8fKXc5CwhXXUVUl/TUfokq0kZD2GgoumgKtoHLvburs3YbyH1UTznKCvOAdN/kH415
 0zYW7j7wLGaK3vWNy34Ho4e3UnEJlYxnEVaMhXpFHIHeJ6rNxnIFkz35zrRgwMdbvAwEZ+mLE2W
 eETQPeN+3ARhqjP3RPOm6wLJZ+GD7YYcvKna69SlRWKQwL1qDa6VNBfPg0eETmrwFLTxwoBNm+L
 GTNPDQqgyjhAQycvYySVfKcC3g/qfO48Bh+yJPiEP8qF8CqnnEYgF73FSpEfv1M0ceR8ywP1WcT
 nBSUN9dmPyb42qLg39BqCnm6hiaKcwi4XdhcvOZa7HSWBbfkHky6PwdFjh+JAPupsVm88IV13Hk
 XFnAMx5jy2jSUGnaqMeYLjrPaEllv7cWaoGm5tkZQqaL0X75mFMvwXWMgmfRU0/Lh+dyRFSFHnm
 +rhlSWt7+q6xidF65VhCIzHBWrZ2pKE6AuAOBcvj+Ta5JlUTVv0U/U+VuJ7vf4cBDDwdaUERR4g
 SbMfH6F793sIFwvgGaB7d3kw1f9izxyXKNrS7TYvQZcqchuDfuOuFy9D3jgtT+xUOreICy8ZTFv
 36aA03vhFaQWYFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa15adf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jHdmtohXv_5nRK-EuSoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX7rftcK2TysDU
 Kru6MP0jzsbQCvuk/Z/LYYSUniDmA1vSI60HaOP0xCuGLnQ/h5WHbAKqz/hmcmkn9pcAuU0Wmq/
 vCaz05o6z30AgIMiHasstOX2mhDmpOgCqWCWlrp7gN4iICSagcRG2mPybTJC7eit0nbhkKn3J8q
 Q57+fKr9+tMptUnL07nfY8Eetgi2rdxfor0CyaFqBrULRK0yy/CwFG8nkVrmpxJKrCdwMTzF4ml
 Vliw9CWBkv1CHEJEANdOZ7UEFYM0U2Ca4qUA9+ShWNYmbQ3/e5MJE7MPmRtNTHh08D1K0PwkK/c
 RGV6T0gIvj6rrNAL5XeHoAkeHfXlpSOMlagWLrtocGyaDATnTzxIyUzaxkd+o4RmBrbKKvpneIO
 7WyMRdZ9vkNb/0XPuzyrL5y7Y9IfJ2LzrGxi32zh4DKAuFQLnyGlXobYzl4A3w5g/SV+ZsKSy0g
 cgFEhy8D45avh/OLOLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX5mSwcnDniShU
 sRr6dK496x9wWvH36CjVDwT4+fztDvdOG1t/2j99HIVxqPxOZkZ3A7PT3TJCvF+HvTuvLWb8Lwc
 IsDSh7paoRtTH6H1KhioW5DxkrDEJ2E=
X-Proofpoint-ORIG-GUID: 13jTYbE_DUO2q-WOwgsRa-Z6Y5UyvNGe
X-Proofpoint-GUID: 13jTYbE_DUO2q-WOwgsRa-Z6Y5UyvNGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090147

Continued lines are not separate DtsLine items in ctx.lines, so they
need own iteration.  Rule for length of line is applicable to continued
values as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                             | 18 ++++++++++++------
 scripts/dtc/dt-style-selftest/bad/dts-line-length.dts  |  3 ++-
 .../dtc/dt-style-selftest/bad/yaml-line-length.yaml    |  3 ++-
 .../dt-style-selftest/expected/dts-line-length.dts.txt |  1 +
 .../expected/yaml-line-length.yaml.txt                 |  1 +
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6d978c4d9832..ff5e715593df 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -627,16 +627,22 @@ def check_indent_unit_strict(ctx):
                    'got %r' % unit)
 
 
+def _check_line_length(dl):
+    if dl.linetype == LineType.BLANK:
+        return
+    cols = _display_col(dl.raw)
+    if cols > 80:
+        yield (dl.lineno,
+                'line exceeds 80 columns (%d)' % cols)
+
+
 def check_line_length(ctx):
     """Lines must not exceed 80 columns; tabs count as 8 (see
     _display_col)."""
     for dl in ctx.lines:
-        if dl.linetype == LineType.BLANK:
-            continue
-        cols = _display_col(dl.raw)
-        if cols > 80:
-            yield (dl.lineno,
-                   'line exceeds 80 columns (%d)' % cols)
+        yield from _check_line_length(dl)
+        for cont in dl.continuations:
+            yield from _check_line_length(cont)
 
 
 def check_mixed_indent_chars(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
index bde91a922477..adf40e3c95f7 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
@@ -14,7 +14,8 @@ soc@0 {
 		#size-cells = <1>;
 
 		foo@1000 {
-			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+				     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
 			reg = <0x1000 0x100>;
 		};
 	};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 6e4140e500b5..6b1209ee4f26 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -24,6 +24,7 @@ additionalProperties: false
 examples:
   - |
     foo@1000 {
-        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+        compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah",
+                     "example,test-line-length-this-is-a-very-long-name-indeed-yeah-second";
         reg = <0x1000 0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
index 8ed08c309632..9cdb7550b56c 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
@@ -1,2 +1,3 @@
 # mode=stricter
 bad/dts-line-length.dts:17: [line-length-dts] line exceeds 80 columns (101)
+bad/dts-line-length.dts:18: [line-length-dts] line exceeds 80 columns (108)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
index 89b36360caa4..f21b823c6136 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-line-length.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-line-length.yaml:27: example 0 [line-length] line exceeds 80 columns (81)
+bad/yaml-line-length.yaml:28: example 0 [line-length] line exceeds 80 columns (88)

-- 
2.53.0

