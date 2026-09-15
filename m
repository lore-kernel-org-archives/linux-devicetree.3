Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC74078E0
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491848; cv=none; b=o6byiybyCIPvD/v+ptPBJ/5aFslV2oSXr6iQYgsat/knCPBLqm3lF6KCwzzc6Kmw2sJbwh/AnY9FkO4KsDiS9MwXzq7U9D+ILwxTP6BJBpE49qakzxJvMLX+Gi2zo8kqwHQGbFzjsHmJ9ELj/fPRN+WzK53Q4ls34VPK7FMwloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491848; c=relaxed/simple;
	bh=xtfVDB+vdhX1n/Ql0XY2Hca90HSlWDNnO9Ce7AFybtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7uh0gmJ8iht+7Cos4u+qqpv0zYQHJ7brXuIzajeEWpgEGcE2fVF+AstKlhlRAEjZdl1mSKTP8TuugKuzrMpxeMPuktJTldDI5hX4GHiZRp5rRQhYRAObHij2gT27FYVhEr+UkcVf7AvmySmSEdu6W8XRRs3IpAHhIL9/6ui/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwvQsEOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSqgdlU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwvQsEOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSqgdlU5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAY3k1014294
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=; b=ZwvQsEOHzwYeG2Cn
	lle1HZnmoEThf5v0c2UAt/1va8mBbmaQc8HOZRX2LLzIxTDMxshQLAfWi+flewm+
	vyL8wviiUhbu6+WS+bQpajpcveB1dIp0Mx/gmbfOGdsItK/38Agonuon6odWoIIY
	VJg9vBj39xsUHh98N4msm6ag00Kicie1X8x8wjArbeJQeAjljFpMS8e3pyqMbsTq
	hLt7qXJguRWz9hyrAVcjjFeTO5VvY0EX1KyI+RyjNIxIjlsJdBgOi8uFuOgt2fxh
	sC4QxiOqTqtfScXNI7xl8TWJoLUEppJLbDqav9XhsUW65If09mzF6qj3rJF2N5I7
	v10mzg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea342e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83124d530so5749088e0c.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491843; x=1790096643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=;
        b=KSqgdlU5snyqGeewrvsVLU0zcMHEcsNh6qQQtwAOPhXkqxIxU+AD2dbIoMLefCSN9e
         gbjOewkx//z8KkGA7vwcjeP8NAQ95VvIwaossozZRKVqFZweAFDQnhrAhLFSI4NW4F1p
         Bf/OoxoTXu1kW5nAGEuH/+QiG63RVrTbwZ37BCatWH0xOVTlWCWwHepnIYlO/CBYyFk1
         wEik+gNPIQNJyFNEqZqn8ZQalsfjkUBmNjaArUQf+PCsZ7QltWVLjxHkzbrxfd5PT83F
         hR2DxF5yfoWu0XeajCP2GjOnBo4PJ66yqtEwJdm5+ucujnR9vURjrBVTEG06pluCZ38a
         4DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491843; x=1790096643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wC/0i74abjzvudGIqaEmY6ilpuMA0d+d0ZW+7rV6F4=;
        b=r/c4H+UIiRrKNb2KKr6FqRRzo4rs1XwQcqHkoNJSfJBV0G8EgjiroUVghhGu/IkyXy
         qcgMxKCo/kiv+85s/ET2z6MzwwX7nxg0DdyrNoUcM2zvhzDyC6BmCC8HQFDAOEMHXxTW
         pdOWKyiVpjGEs8pGsfO22eE54FtuhYLLffweXygQbnlb88lD7bXn03qz8rSrZ6sdqOI2
         bWOXervmmMEmJFyKqjte3Nzcu1EpzI4BXX+mcozVG1ypmOwF54HqUPjxOGjepnHaoaR1
         6kW78sSMHBVRRUMOkqKSH8UdTqkiTW4HSaba7sD3Cnr+Pc3wLy9qmJxNRnPM5IsA60Kd
         rJOQ==
X-Gm-Message-State: AFuF++mUHT+p2BJ1tl5nUfpuMo+zEb5FzpgezqtQzn8u4MQrkwenNJIQ
	wFQFj3B1Dkiw46Om3t9BPhuM9PEY34ch1mw2NFGrCkXp5M3sQAMexP9hRsFPsdf1eliiG4MTvU5
	fzM5GvKO6MToHtFEENuLjqqwl8XYpZcIvgJluUOS0EpAAc3k62f7/YG+GasoK+QGc
X-Gm-Gg: AYBFou1NEAM83vuBaXaLSIG47AZpigqBGxyH09vm+1raBf6m5BtD+8IynHXKAiIduNx
	hu6UphaYj5/2KBy1fN+WZEcE/Vqzb7v/icnB1FzAnteOmhECGYDIQAz6fC+FTZ0w3WwuduNqq/e
	tvqpXVnFuHvZdWaoGLl2P35DfakRRkPDPIdi70CkJauSZDNX7EQQyQhGU99CLcYDVT8s116ecB7
	Tl6DZeDZWNAJGmL4bCptJxmzHJttc5I/Jbr3PfP7xL6LScVZe5LM6tp1aR3osmaoLsEEz8pApaw
	Tq9Odq8WhRJPgAdiaoX77M/YGG6HGrJIbClgUY4QHyveUFalPDbP7sbwPhNuy2RJw9T7AFQQWvH
	ArOQGZhoMKl9SqI6Pk1SWGyU=
X-Received: by 2002:a05:6122:6401:b0:5c9:983e:79e4 with SMTP id 71dfb90a1353d-5c9983e93a8mr666712e0c.7.1789491842599;
        Tue, 15 Sep 2026 10:04:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6401:b0:5c9:983e:79e4 with SMTP id 71dfb90a1353d-5c9983e93a8mr666649e0c.7.1789491842255;
        Tue, 15 Sep 2026 10:04:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:46 +0200
Subject: [PATCH v4 2/7] dtc: dt-check-style: Handle continued lines in
 check_line_length()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-2-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xtfVDB+vdhX1n/Ql0XY2Hca90HSlWDNnO9Ce7AFybtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp2WM4JJQNSH2RzIJ1h7dfV7/iAkRFBCSmSp
 JUFM3w2OciJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6dgAKCRDBN2bmhouD
 14JSEACSyZyTkfL3i8/MxfguupqRACcSnvAuKAZ6A+xtnLpjaKpLB8F8PZ8zSfbCIev73FZ5Urk
 73ieD7+CpwndVKx/D7yvLg0iJGq+PR9Bl4TdCH1Nf6+ZyOaL6gsD1nFd5lBpY4vLAhVF2SVIG1x
 RPwSzJoUk3xKVY5LxbDJWh8EYqaZru7WnO/hkbRGt7qgJQRF2HuMZaE5y8XSL8c2gyriyWhe/BA
 7eJN8eGOVeB7Du6Ti4uGWRGq3jPYcIbgkwme7iMQmWpNQ5rCKixZp3i1yPlOmKw24qkw+vrmMkE
 fgodacVTzrf5d0SRJeSYLleR887bDzJU7HhpiI5SpPMEM9MZpVVgtW0VncAXwQx2ETt2nu1MOrR
 uN/VTRxbp61KXk78NSc/rdLgMSBwD4Q0tVJVPsePs2v/XMATxC9gDNLYLbxH9rGODKixZAFzHVU
 RsVF5ZwkFiKYQe1xLSxmB1qbpuSvNjr6rMrZwKzMxBaxokY7Rd3g4qrVTyedzsF7C0hUauM5Jk8
 mBXBs8aOKGz884t/dTIIBajcBgXqJS5i8I3Vv7VZzHqX8aENsrQ01/qdBvKOASpaDp46+kS/1nW
 lTYLDU3kuJmG+3gP2Ja8ZaFEtKakdG750vrcon1rRm6s+dn2WXe22toluwPNYjr5ajO6fzVqYva
 ykArcjKADr9kHwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: nW-8UnHD4zRVc7huBu9tCLM0vZ-ZDpaI
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa97a84 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jHdmtohXv_5nRK-EuSoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: nW-8UnHD4zRVc7huBu9tCLM0vZ-ZDpaI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX3mmeUDtdzbGD
 P5U5FmfzPZgN5Qb/sSkbQQYpk/3CylyS/qINagdswLzdlkddrBaCavtQ1RZQ+DWC//FYRb1Tbh1
 WzWQedCnw/loydcBpOEfehdJG0y1kUQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXz6/gdKsonR5H
 W/hzztw3Q1pjQohaTHRZ234o3uFSq9xAoKUpFiMatmPUcXiYPEgQoNMw2FUEfEkiVAfGOwuRGag
 4oqqG84u7eMekaTgTYdrOx+QlnACgmxzGpIpmXzUVM1FUezB5REveW/giT4w+aui/5psMTMxDUa
 GzlfUno5r2hK4LyiBB7BEBqay9iVARGW7s9yAk/0bmG4+J1G2XKFzjXNgYu5jnTWbx8SlYqokNi
 UT2JEA3KlAr/J1xPqiPyofD8F7hnXX/Fb2dqLCOWwzqcWmLzV2a8k6zPzGogQkEk+zLTKwgxz8k
 /H6fQvidl/vtWn8xV8rzyxJr9OZbTDhHaIUKGAlufEFG9zx6Tn7vJdbEa6+2b70X/mbYNXB57WI
 eCTDbKirDHtF5kDKh/BepjEH2DfiEpDkzkJAhWpY+6r8Nft6ZoliggpFFIRNRCRKops1O+9FXNJ
 LtvMt2IgjBOt0ai4H/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150249

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
index 2d0463c626e5..525d9df6c11b 100755
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

