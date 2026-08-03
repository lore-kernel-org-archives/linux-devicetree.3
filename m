Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB63B992A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747843; cv=none; b=aRD4bOG2iFJYzhtIUUslHzkczxqmJC6yyLa3WqL1LtHFBqHvhZYuHCCsT/RP5m9cePblcXKG4lDLz5NdDaCceCn3kWNjwpXrdB/aftMjv2bPtorGhj+vLKcy+75Gfet6HzYjxu1VNHBaaDzqh4kc8fF0ppYIOqTMYtIZ31rCvH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747843; c=relaxed/simple;
	bh=47cyNALqJ25eM2F66KQ/8ZGVEN82PFz8l8ZFAkfaakQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVIRv0gG+8QRvNKauXFqTC+yFww6f9ksS+f84rqkdZuksCAc/xN/JAa6GZwFsyqELzM9N1lukUZrzQ0KWn6iy1Dh5VYO9pdup8uJG/B7ZbFRzd6d+ZLXQBdK0yeID5YvwC02wJeBfCLcdjk63A838tiVXE0lPL/C/q0CpvAtGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAaznZdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bw0yadq5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAaznZdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bw0yadq5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736E8LC3883454
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=; b=VAaznZdxhQIedvL1
	pDy+isc1HqEa5FEuCYB/NZNZ+BCnJ3Uad0ogU/qmxwsFOLIsrJxPqpj+lYbY5DSE
	6MwB0ZX3GoUMko7Y0+a3KN9vnDpz5eDWyrWGOCyfZPvc7eu0hm3shcw8BMFAOEbP
	P3ko13rPWWLKQt4jO+jL6XTSr3XRhkUQN1ImtoVU59svqACUI4SKCw3CA23m9gPV
	V0sIhIeZOn8ofUrnyiJcfaQPcgvJXpMZscZ3dHPfFjxAzSCmLbQvfQZalKvA7dwc
	/391/Z7Nnxn/YSxXF3xU9vXrYZpCEgyqVBmvOeEp2oxi5CPt+XhRE53IXVBU5QAr
	2Q1+sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgqtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so32709221cf.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747836; x=1786352636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=;
        b=Bw0yadq5G4SREiv+xowF3VXsTSH5f6GU0Sddr1z3qYIMUtAU1+Ymk/+srXTp1p4+n+
         HyYs7a4SXtYztjm/Ycrcfl5/DBn/lDvE2YVUQmCd3cJTtPrbffIwQF71/ygoVYadLV4u
         chrsixfEjbYXR13zOAUiu0vATF7TDFT89debE3+2avyHjB7ndndQk5nxkZhbx6KijLsR
         fIJToT+6xosPXPqfqGRzPAJgrjPZgvw3qC4Ba5lN6c4A1uvxfGCXL2SfgIRF743aW9m6
         0C1ISxWdyc1r9qhTYJfUHt190iMEd3MA5qpYwc1xqel+RNO6Jm1GhslXMkkcC3zIXf5H
         RuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747836; x=1786352636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CF8fZpPPj1Voth88QksP9FtwhMfjRo8kHp6QcvcnYo=;
        b=pPqojiM8uZjVESJe2VWkE2CEdfPVUffQcKJnzPjtlq4CuBOUZUVyzSAMMerFrPBDv5
         oBxvJbSXdIpbQ2+om/J0/vg5C7q2nHK3piJqNyW8Qgb+CVxLnOGa20p2/O9HJzJifdYc
         8Jk/qz0CRxjT+8/MNl/BcOqiVmUmZ7UJR06/fhSzQkLnNS5Ng0n9cwuPuyPyXS+am4Jj
         +Y8VcuS1V+TFSFy6uTcaQDBQMB8SWtFOKGSiQlr0RlomXTdRYXCpDWnebmS3sdIdgD9R
         73RPndT5vbPpZ4UISp6QzxsQWrtgLbNFOgdJc02N4aYiS2l8yMwwpW35xfXWc4M7iTQY
         7F9g==
X-Gm-Message-State: AOJu0Yw1wpvvV3hueAZhO0zHObo/fnP5NTZ57ZpOzM54EqL6Fjq/kH7a
	vRmi+WeLAHGOMQ22xXviqY9fWoa4GFpUSrV1POIJZ+/7IjhLwWurKFbfaMZiKSfr+kvTAyGOzjl
	ZA/zjLxyQXKrDihoFr0dbDu+bTdy4OWF9qIRs3Cjt917vED52fK89xgZM8e9Dbsn0
X-Gm-Gg: AR+sD10T0I/+TgjPjXvsFXOiclemhaTiY86gSZ51j17ZotzEhvpJNPMSdXmBol+FOy5
	HzplSwcjry45qrDey4FCVPsAzwRmXX0tlAloZmPEQtZRCLVUF7ywLbohOtvmDEV3LbArYGYno22
	rxVQ8Ydn246eu0N21bLIvh500MmuCjG5MGo4XybhZBcdgFuSIeH4N1/55NYut0fLEe7R+Gf5VHV
	Ly/kGlNVGRZuNeVlInS+3FSkZ1ggdwiztKhM6MpmvJyYvLuCBic1TDWyOlfxRBQICrajiGJGwrt
	96ogUo8NimzAsVKaQmTAU98+dw+ziYpXQld3QL3uq3hQBmDcFEO6eD7QKdIh8IvX4TTTg9JTQYS
	jzzDJauR0QzhBPDmnHy/IEG0R
X-Received: by 2002:a05:622a:1e10:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52b4c434166mr210854271cf.2.1785747835674;
        Mon, 03 Aug 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1e10:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52b4c434166mr210853701cf.2.1785747835075;
        Mon, 03 Aug 2026 02:03:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:14 +0200
Subject: [PATCH v3 11/11] MAINTAINERS: dt-bindings: Include dt-check-style
 in DT binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-11-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=47cyNALqJ25eM2F66KQ/8ZGVEN82PFz8l8ZFAkfaakQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlfFEoOq5QyPM+S0Ftm5ZlOyg9ajj3uO3Dyr
 QdEwbL6MdmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZXwAKCRDBN2bmhouD
 1y5dEACY7QRkVApv8euciN3KNt8dc5L7yYS1g0Aw5lWQibEKCrs2EsQljrMZtOmNZG9XXmyDv2z
 O++XJoVpDq5OxYdRFijedZF9nXD01kFlRNdlGO+my5INg0laV43tNwIeGoebm2NH2HG3vdfX3hd
 HlQfjhSNlwNWx0VmMwiALYpt/9fP7sHDYwwbGEK2FrKGgohWTavUokXtXtsTAWYNGJmzzDm8t6U
 cisCs2hOyT45ESsTqz+A3OLXn+0iTG38F6Vd4twHTf6jQSf0ncYRQKbLoWyWap1WsgkErO5cHSe
 o4/JkCr8KwfUbO0AVtcK5obQyWYUoenJ2GedMdbSjixaNqet5SsE+e+kIaz2JVgAKm7RpmVmO9u
 d+CmEPNrfDJb0+kqBFkPbjYqUSVEQNSGzhlySbCVxaWqnX82wV02U91G4pyRNtZxgp1b5eylwIk
 UPg+VvKv+11a61oDllHfWTbJFmI/1YAWDbmo7sqZAJGcZhfG6/GG3r22PJe0AX3Kjifj2PQyywm
 iYsXelvf5g3gSZn9XoYf62t5Cpj0JX0M5diWVVlUAdTgls0R/WeAeLfkyyCUNAOXKGl0vWdIgxc
 2Hea+uIqpdVDSjwlw5EDdtjVpJ5J4KIFqvwHzemExnq+xOkX8lTj4QKmvV8FJTjV5vxBYRy6yyM
 TAEZtFjk2Dkt6Mg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: K2q90Dt_gZpLp6Zi7bDIo_XdiFUMg3zK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXzxqJlfQiLRfu
 50Qy4P5KM/hDWy1AZJ+5B51B7HWwqnCFZJIaFv3+15JIOohBi51xS+faYsp6Lj3lsBb4iXztSbj
 bDaC8rf2S+wV0EVBBJuqGvv/KKI669hzz0vyzgcHJUVk1DjO4csmEDKOfn+bMcJZQIs6gxplasA
 Ax9aCNVyO7QL7MaptItL/TlZdZSpFAe9+WfyYmCkUks0/Lfr1M9YirG1KQVQF30HFIaui/gMb+X
 4TDP7fzGn9xHZJzUVL0ans1By9d2yfPqv0P0mh9oYvYtfMAoSztmLjofdoik7OvZCUoMB3uYfEr
 yNCcdyCMOjnANfs2ZETJTkZaKqy5/FPn8lEaJ2xHuEPDbyhjXzXqevr+htGcFUPEmoix4zhD/Yj
 amGm9YwFVD4RYLUdPHmD7cmYrPNMDSg2oaM47412pNmWHZwK0NdTM02fr8aVzv8k+xDv503bxRa
 KFKF4Ack/W5qLn2r5pw==
X-Proofpoint-ORIG-GUID: K2q90Dt_gZpLp6Zi7bDIo_XdiFUMg3zK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX2Bkx+h1IwWmF
 9Fa/O1Qrg2hvCcTX71Z/HPyR6EIGg8M5g2K/ZUE1rGfQN0mG1GHrnJ9d1/pZe61IYCrnUn74Jm+
 VOgvo9jzrA3SAHdyCRpWePlANMcuK6Y=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70597c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030080

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..2d0cd7602a05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20374,6 +20374,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest/
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

