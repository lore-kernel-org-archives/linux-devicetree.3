Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96D3D667F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353237; cv=none; b=Qpb0MRcFxetj9Oyx7lbHA4jaiy27BN+z8Inj/GM/XSB16TPM/RRJ9+UydemsvkV93n6KPCr1sfbnljeFEVqHZRzud8iR0HX/PeH6+8FNT5UHXq3/ALX7DdNUn+odoIJTx2FIui8u79tcCTKPnBDRgtjngs83TOWGQZdGmsuqQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353237; c=relaxed/simple;
	bh=Mf+PNiF0r4/fPEfBw2oaXLtONBxTMX/GmK2pY23kty0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxlGO05/CjQgVuCPocl/KSezMIDNLL7A3I2HsuglCI2gvmNlhPFjcho5aAFQ527ALc9QaeYCt0PANifxh73ckZzxhMMJawULyyWvevgdPr1GLGiOcdrMyEpdo2FCYHtQY0wTHDqLzcxN+6edhYvdghDB6xFTQj0YlQxsK6C/BdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deCYnIfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Psexxx80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deCYnIfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Psexxx80"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFF0t809726
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	doTtJpdnmiHJKC1YiuEa2VTWU+Ae7kMu/XwcbAo7qnc=; b=deCYnIfDr+r1JB7S
	6wz0yGMxtB39XsAy1wWFoWKeN6JYDceQ2O49WvLrkp/nBrKoUerjKARVR9VvR51q
	TUWK/6Wv1WyfDJX9OSssxYBqWgIWdGUqgimf1KVuDLJCx9qG5iN6Rf5/cDz0p/Lc
	ksUsyrMuuETTEhr4nlECZe7IX9iBQf9KUNeRnJ4lhQ7f9GnkKMRRyWcpcNw8FB+8
	2vRxUh1QMiUpaWXtlPxzkVItCtarBi+MU2UC03YoqxHQ+3IM7eWYBbYwezKR9DMc
	mOoRa0AyPg8vfdHYshI/3SVH34o7dO/sU/HrF/var2bKubqPYSqZXBqLfT4eu3aN
	CuQSXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsa38k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:53:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so233072585a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353234; x=1783958034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doTtJpdnmiHJKC1YiuEa2VTWU+Ae7kMu/XwcbAo7qnc=;
        b=Psexxx8017Qbsx7LHuppnmPV9xk+XQgegBcSpq0vPr2zK2N9/OG640MNQsIAGo+GFR
         heTGs0TjAChfT2j1HsBMkJBp17UQ4Y85uFlUekf1iNYyEUAGbqog2VHYq6G7lcYON24D
         wws11dpzWM8rc/VbUOkZWqzHWQFwxkSfHl8Veev/olNQRmpQ1yMX6/nsuDpVuWgo+YBd
         QT0M7V0BmQ4+f1Hmi9gYP4WaX5IC8kXWP/tZGW7EKTdAbukh7lH5STIPE3rKJsszCzYS
         avid6wngACJbpHHgb0JypzfCLs9pyCt64XhfLscJ6x2FOTH4op3DdW4LO1opS91RsLiC
         m4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353234; x=1783958034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=doTtJpdnmiHJKC1YiuEa2VTWU+Ae7kMu/XwcbAo7qnc=;
        b=RcdiIMhb55NKOP979+O9i11NBcccbXSVM9bEPMoruJEkNTeaaxgBv4pSbU+iZD1diH
         DOL0jLdI0M3Mrm64yk1N581kdFmsjoJQTQNS+2N7G0Rlc88EFJeYaDuANR/i5o9bQszg
         E8vEmS3srbv+7ZPvHca83zp5rYPnViOqIe1Yr8JE8Lo7btf0AfRdcmPZLE6w8c2jPuzb
         DDVLGKeTLhPIBeIK0Xc26g/mij70+X9QblEAEvJS8PLPi/9dGjm3ezkSIiDHiRYdj0C5
         4J7mmyJ5demg/rK2JBxOrVvxeemQj/883t7yNGWT5O1jJ6Z+J0037igIuUENxKEjD2Gw
         a1jQ==
X-Gm-Message-State: AOJu0YxTVTdnT+qAHZrQu0Bax2v5JiBmZYl3d/f2K9o5TWmCiPQ6Eycz
	5ohqJzZBOtiJvltReoGVC66N8gaGLaFM4DcbHnVFzX7uUgAkMFK+fnrOIYdbbdce22ix3uSWPjO
	sJVw+M64VDfWQI35eJzz55osI8xX4wEVr0DDw7BfSOlMEhvRYUzJo8t9ppcUFBkfG
X-Gm-Gg: AfdE7ckugh4P9LY6X/j2Mvyh7QJEGvh5P6lNNWkG3Mg8J9D/FejUldbTT0006t0xgi8
	FXGA6lN/vWBxwPF+t/W+a3kFApMed4lkXTvX9IOG70/3tYregjy7WTRIbKNRf/EWsm9p+GszVd1
	uTJH41PUJFA06iwfayfJBlpHiJ4w2lwDxtO3OriiEK0Bj595sOayPAjEQEtq+D1H+Ks0kt16Fik
	nlif7Sdc6wCcwmZ8wumGprWTyDqqyDcZvbKuWDhNW8s5EQGiIyFlvg8i5DlXdIr396FEPhFWL62
	uN+wopJnIZ5rIOb74E7KLj33KAnQqI0kiGu/OiJQGAeEOz03mP56a6XE1mVIrPsHxf1CND7th3M
	u3TkePpW+E500hoMoau7MVrUoGNAxQfqlYQ8=
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr158268385a.18.1783353234213;
        Mon, 06 Jul 2026 08:53:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr158262785a.18.1783353233524;
        Mon, 06 Jul 2026 08:53:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:53:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:40 +0200
Subject: [PATCH v3 1/6] dtc: dt-check-style: Narrow disallowing of tab in
 DTS only to YAML
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-1-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mf+PNiF0r4/fPEfBw2oaXLtONBxTMX/GmK2pY23kty0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+H3Zr48ztj2UfLm2OGi82KUgUJKZIe71kwm
 9YkIOB3vcuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPhwAKCRDBN2bmhouD
 1xpTEACBg1CaGngAk14LarRHh/s+x63tDvVYQofvDYSlanHEQIayhtahLoNGjW/g17Vq0bjtRmM
 IQH4v63y3siUlK65dGGhK0Du4xreBLwXkEev7EjS69ufuZI+bnUbVU+sZEkGORO3S1DE4mLWnQM
 ERldLKPvhFXFaX+wZkikok6VRZ5x9zwQ9umoC7YsuPM9TZfxI35RyMDzHKRZUHGyKGnaQXc4AeI
 hmoCko18UJUIaZ6JGYotf3EzJjo2n/augdRdg97egWmx1Mz2oJfJ8O0yvBW3vM62+rnHkVkT1bx
 ezmEwmVSyvtahsHgtP2iI6iJ/+ZZHDDtIwLz9ZixCwqybHp5RuDH8/HSCGNTs7yBdgQvKhWZuOY
 8K3IYt8eyQxGM7SmM8FgH3Ucw01LI9cV1TOPEuSdz6sBDZJ0C16EpavV4E/PAoG4J66vZF0bjG4
 LsozrUVijCEFXjh7840WucYJ0FspOcfA77YwfJ8WKawM6ksKzZpJ57WMyo97DYnkxteq0uFtbJA
 Nm37ipIIVwNRZ9e05jIjL7trFovlSTg8BBIO66y31rnKgMqZiIh/+6tJHowgDqkKBATYkioWHer
 X4350K03HhbpzU5Eg0e/fYcXWsy7/Rcgi/Cg/DLmPibLD1GGoqg5KpOmVpxEBgrAtqaLS1DMyV+
 e908hyTFuIRrEFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: IKj80eReDq-NN4wXDj6u6eLaEE_8Gflg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX+2kveuS8tWx5
 6XTSH6Pz5bjlXkx7Rq9II6ny3XJNdEDikrd14Ur2MAOM2dS0dYgddIjpt0quBzipAUlVg5p5b6Y
 +ud0wwbvA8haGrufZl52Q87xa1XFkDWdF5dfw2Gd2MNrOKNCJ/nmKTxGUy45bM7LBI3af7q6Yyl
 XxeUYGhjO6GJJW7UPFS+Y61BPc/4miQkLk9MxL7WBz/nQDOh+eHNVgr7pAiTQrHeOLxABZ9ELop
 hvtEAih5MB0IFtJZ/jcbwTi6ZRMgUYyw9PZz/p/xjCDBAEeRFJeTt/SZ/RssyiscymQilwSn8kT
 1QcDBU5RkABMS6v8vIqdODuypkjLxk1JWHofPekkts4JjdtNlVVDmdXxgY6ZanVrSWcXAlHoWMy
 u5Ho+/IDl07/85GZSAukKZk8Lj2nayMEM+mrGkhbUuUQ1WstPs80hdD8ChO3s5dKZ8qUg7xglnj
 KgobuL4Uvno24dwGA+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX/P013Sx1Nf90
 GhBuwcEYquHGm/FnsnnyqxeMAULkqkMhso+DrZRobkUqA52eUsjj3nXUukR9lJ8AZH72lbxcSX2
 6W76UtOvv3Hd1drMT7J29An4c/dNcnQ=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bcf92 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VZw0atn0WgoYOWIgC3UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IKj80eReDq-NN4wXDj6u6eLaEE_8Gflg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

DTS in the bindings (example in a YAML file) does not have tabs at all,
but regular DTS do, therefore entire check check_tab_in_dts() has
confusing name and should apply only to YAML files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 scripts/dtc/dt-check-style | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2d5723d41ea3..34e0f7e2a57a 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -340,7 +340,7 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
-def check_tab_in_dts(ctx):
+def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
     For YAML examples, indent and content must use spaces. Tabs inside
@@ -929,7 +929,7 @@ RULES = [
          check_trailing_whitespace),
     Rule('tab-in-dts', 'relaxed',
          'YAML examples may not contain tab characters',
-         check_tab_in_dts, applies_to=('yaml',)),
+         check_tab_in_yaml_example, applies_to=('yaml',)),
     Rule('mixed-indent-chars', 'relaxed',
          'indent must not mix tabs and spaces',
          check_mixed_indent_chars),

-- 
2.53.0

