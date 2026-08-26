Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE8381EA2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727994; cv=none; b=gGeKY3qwU+3pi4FVgENOlQvgveZoUWXML0+FHCehYQ0ZI1cefoOaXuHQUKtvuTUs1q4Q7IT2vpAmPRwGG//pUnwCWEjwCeLSrvSxPz9x1rOOywkNXUVTQrYAv7NEE1AqbLTJLbi8omwb+xNB55Y0fEk+NhYAF7vcyvSXXUUW9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727994; c=relaxed/simple;
	bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kL8nednYdykqO8UgtW7grwRK6UUcB1cs/Cr6mowly9fvcHcX8O82/PMfNMlEX5dVAbHXyXNBUX611G0yCvtk7M7tyTpnPBILITK35E/3tGXUAKjZNY1wROloQQxoFBRw+dvIkWrN28KPKoNnR+WeQYBKHbXbKIzbPnjjBH1j8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koVJnDjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaDgn/fB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koVJnDjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaDgn/fB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rp8A3124074
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=; b=koVJnDjSjyPa7+I6
	sc7VJ5YBIvvKQJRMMqCxlzRuFc8aHbNufP7an0ITUUE+GYFiS9SmcK3ZgL3bvllP
	R+aUUimadKisehtSAVPGrT2r1ghM0xrCclD6xp5KhSxDyGwPuktawRfZgxMl1OAF
	bOCZA3mrdHXxDtxtIPov+cvPly2tDjE+xJeLQk7aATZ3MS1Fx2w4/cR6VZSnlt2y
	JGtBGyYF6hyZ4BNRnb375IpuGqPA6AFs1n19OLDF0KGgjx7542Qmt2J3frqYjfY5
	d69uFwQEaHrRdXswtvbrAGyKmzZ3PgwPD6BF3E7DwKdKYm2uCT2yMGBnyMFTJy1a
	4p0E4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9utjj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3b6aa2so3530771cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727991; x=1788332791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=ZaDgn/fBYNImzHa1FP0nw2/KNv1w8bHW5vU/e9gzpE2Et619bV/tCgEfaR296iDb2r
         ectieLJvkm41SpFk5MSXQSNmuvhmdjMEOE1jt4B/wa6DmPi0HbPnKsoitk45b01WTyM8
         sypyNLg//i0Rp95XRdEi1MWjvw1ChCZM64c2JX1CwoyXh9nv9Ro5YhX886b6t8bURjDL
         +znWinkTlsshtiVH7+uwHQxVqm7qgZVVt2/APMXuaz/m7kyhjKE7elV4mooh5e1Itrl4
         WxBmHkMR9RjcdgysrH0CbgMm3med0bN8vKKoqvOm0b81m52nJueoXu7E5mDZr8pT1n9V
         NdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727991; x=1788332791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=eIpTkvN26CinEYGlPiyV/7Jl6BgeMxlk4mubXh6g4e8gLBaxrkSkhf03XJNXl7Y8CK
         hogOnCf+wpJYWk7qTg9Mx/OuYj8VcIqSEY7hF2RernwFZa7jh9vC3IA0iyp1amuNLEYQ
         4fhAYYPsDO5wxa88r1xpx5uaH9RBjL0HbP2asLGtBhSgJJ99LLqydg5Fm/W8o1xN3TG1
         2NLbFcrEIdMX8KoaSpeqHHN0q7oS0MjU6W/B6Ox5EkFUWbIcGyTFMzkOVvaRi/t9qzPL
         2rQp4+oZ1kLEHaFSPvD0eYeafiQZ4gejvsa41jQXQkgDG3fNE5fbqBdRAPdEcJ6cLZ01
         fTeA==
X-Gm-Message-State: AFuF++kwktdKTdQxCOGbRUihxPnI0v4dhrK/XBeotywxJ1kc75ryG4j/
	t4zhspoAXknobfj0xA/yf8dDw63j8HYD75pb16y6lve+IdTBb4Ql2UD1QrU6F48m2ps1PNhVUtM
	0DfYWCyTUReD4B4X4uSsL8l1eONJml8/Y0E5MYvvq7O8MputgKOlWfzYn4lVarswq
X-Gm-Gg: AR+sD11gQ6VwZgcEWvqYgvi2GaEU6Ln/DS1c80gmY4CSr60C6bAKN/DdEMDSx6Co5LU
	gjvS2dsEYzQ68k4NTb6HGtvoHAgzwUTMr6FUVG4lqhltW5CrKJC1lVraWxNGmv+zVWT43UVxOOi
	VKPiCOYwzOryvQVXSRvZNHlcGdOqzmIO76YltK37K6z/ufXiDkw8SaMiCArfJ/kfhZYidST6Ooa
	TZS1dPAUQAsCsrhrn8r4y9Dc9AQNDLPvwJrydOE391l4qw3K99M+j4j4RFTYBVrLlclFh3UEMY9
	QdymnMV2h7vuTRPi2AlsUsGiotdjyoGP5uB7pphf0IfHC+yhOupm5gK3PuyLZMOzqwN6upkiCC8
	+489qAQCPpQsQoumxDE4h6so=
X-Received: by 2002:ac8:58c9:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52e4227150amr41640151cf.16.1787727989637;
        Wed, 26 Aug 2026 00:06:29 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52e4227150amr41639921cf.16.1787727989229;
        Wed, 26 Aug 2026 00:06:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:06:01 +0200
Subject: [PATCH v4 08/10] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-8-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBf6LgcSSdsFTH++TETWG/ezqsBymbXpQhym
 l6whHY3I4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QXwAKCRDBN2bmhouD
 17jwEACF5a5ZJeTNJiyIQdYb+/KVseeaF3QOGmj8xlJNWyfH0B6RsEvZfpNiOhJ3OxJWOPK4eBs
 kVoarZEWSH+EBMRVnXGix91HoQU63/8Kis7fD6QXJxHYVzkw4prny7h5kOkMnw/x4QBFb7HOLfL
 KLQWfVlvYzAcVxICvIigVlvjmPVrrHSY2jS+Zqd02E6rO9uuxj2/m3WXoDq6cB2REC40oqahb/D
 bRcrcjFiwfzN9q3W8tJAPIv9I5bfJzK84DB1MEwhif/SdwQ7cr4GDYaPpx4xxy2nV3KF8iJ7k+i
 7L14hjxW1V+sVR2wy0+ZAzOv/H4ecBRM1ENip1HQHgIAWZqedOg+Iw4q9uteTGq20slS9X+LthY
 ynNYKBNu7wzuTqBleu8za3NXm9kBCf4dI9nabT/xuiEyIN+psmkSsOj9P7J5o/sFzEhe11Fzhx8
 IwV1wT9uuvb9Nzwl+usdG6EibWJJkfJi2K0qWf9ltfuioC1DieUo4QLum3/vXTbPXi16GjOlR+7
 6qxyUWXr5IaVaASmdKsMkH43ZgtYDrH9gAPsyN37t5bVtWOKQ+MuHQXzqeaHtizxemFk3hhLmTg
 g+eHuFteIWWDCATE172HoVbop2iQfN4rQYYV24hU+OnkKzJOgYHuwd/mcizOtSs5S89i2N8BKib
 6ar6k/5RX2pxVvg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: PglieefED44PwZCkMzYZuECBzpHG1Jha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX4fXCVa6thJBq
 O6xtLUUaWaqKVI87yI7u39ncejH4MdlWxp1Ox1WSNZ/JDf1vuFX8zV5grOTkJdMKiMLrnuXb8ta
 xbNtwmeJKl0HEzHUzKUM0wOc/jp65inE4SMixBScvdIHGumVL6iPw11k7TUuhJqv59wmzKWQDUp
 rxZOs0TpZpEk9SzaVHYP0uoGwZOquMPD3q1CBTrSsZOPeQungrG5w+hNXpqjIJ2jMmcjB/XHUAX
 rwKUsIXBLfDCX3b8bwM0/wE3fO0RM+xlhbCb0c0+38znvrDO84WEJorBbY+REesXNadymQP8Zmw
 LkXvatI94s+9Tf44zTHnjTOpcIlL3IR4bopjaM460M8ueG3z4SVDxEJfsOmLX4VgK/lE3EoZe4P
 N6jCrQuaoZdXATrAvMFl0uSAs1gUJ+exLDr7R0cBr2VxicstPWlQCZF/vs7RZykSRlavNdQI6TU
 gE9eGXBVrUHUhhzw87Q==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e9077 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZteHwOODggqzs_94cHsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfXxV2LMEwcsMfN
 czCTuTFufrds/CX5FlQL50v12uMOZeEBlLFhodd2Sm1XzhiTJKF+B+dg5sKeNNXTmA6yFzS0Rvu
 ztzRHGNmnexKadICbVBydU4EHIPXvN0=
X-Proofpoint-ORIG-GUID: PglieefED44PwZCkMzYZuECBzpHG1Jha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          | 8 ++++++++
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
new file mode 100644
index 000000000000..1eb24d91c640
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";  
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
new file mode 100644
index 000000000000..94d9ae9d616c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace

-- 
2.53.0

