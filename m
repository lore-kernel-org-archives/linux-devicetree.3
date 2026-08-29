Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC73418A39
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033233; cv=none; b=iUCQU1g/SiH/Ie7Fzarba0J4TFpCZemQEgLgxyi55RHWX0pwvKj3kvXHlwc6e1vViEGiHorlIMfPljeBnLj+NUG7m1HoNplGntfE5g62IEWP6jCGeLd2XeO0tm3VW8sVutssxANlbGVzWG2bU+/lwgc6WpUqzpdTo9RdOPRTySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033233; c=relaxed/simple;
	bh=Q4xOG+7CJmOJ9HgHFoiC99hD/Y1Ja8xpzFRhtIWs8pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kd9vHqxEJWE9DQAbTRNInY3djFXKOr6/wRCRyxkk/pAGETc3kiQqkrBTPedKJ+2gss4gDfFGhYTKPv8zIYrq4+4Z8mxO9D6MHI1y1gAFtYhjxJarvtfO7lNRVvUolCr4yfxSddCjKVVfKF6Z8kq3YOm/11SFcQYaP9ZoVhqVr3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8uVxuFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3GeLwsw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8uVxuFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3GeLwsw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJl0gW2082249
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A89yu4bxsqfiwMljGx17mCYDJ7tE45j5M/CKoT10KRc=; b=n8uVxuFDuLfFmk03
	dw9aaqg90VH4kFsxos1WAXFrY54HNWZZL9LBmwDzDF6gMMKMqk45Z6kLcudWLJmn
	aU+azpRhDC+qdf8XntC5989ItcqvsypzkbgwE+HCcukS/Dk6qsJn+BE3CFv+SbEs
	Zd4q3jyrarzc2mtO6sU/hgUlxSfHPutIDymBLrBbEkFRp9ZqKpt3nwbhgAzWzAAl
	UKFWgaVteC3Ldn40Ud8WDRPfnXh+wo2SS+7nfRr1Q+qnU+rLVm6soHW/MUGpjSbO
	8wgnRpZ0qJwKC1VWBm5SoXB8huZW4XbFqnXEDNdAA7PxzDG76839QkN4R9vxH2wX
	gMslkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81grk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d827597fbso24401391cf.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033229; x=1788638029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A89yu4bxsqfiwMljGx17mCYDJ7tE45j5M/CKoT10KRc=;
        b=T3GeLwswqhQuChAe0RnN58va8QhIwL6SLLoUWPdaZMGBuoatM6Tk7BO8gam+4nGR3/
         vcWy6HyDNk/V/+qXqcxhWB652zaN+BqjEGeVBFmQKdKBGtQdE9DrlL6GLELshVnD/rqN
         fnoVwlPC9KOlSq1x+HBW7xm8JDXhLUaae6u5wYuL1aBCDScrI9YfufFxVrwuGN6VArDi
         cBE3TFaYHBNZ98fA1NHob7R5OLMdRDgVmcSS3gdiCbDqy89QnBrNccieox2vaicLBLlI
         B//Op8QBzOtU4PW6+LkewUMJ56gP2ho6Xye0vJ9y1D3EXFg8ynvu1w+R7GJ/uYa5TSHo
         YTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033229; x=1788638029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A89yu4bxsqfiwMljGx17mCYDJ7tE45j5M/CKoT10KRc=;
        b=mvu7qJWrYzzMZdUktzfO1Z1Jzl8zzpEVYCYUaB+h9fpaduTpkQQTM88D8VNRGUCUL8
         bTjfs+rxB/72bmIAPxwWL2D4yvkgsaWyPFRSRGazS+HAu2Qf9yBLX8/AvlSaQEsfxEGU
         xsXDnCEyhyCwXcMtnASSdfgFDilkU32TbYwDia7L9Z4tcbGHqRCGhyjCg4k2qEfJmYCu
         +B+aA1Ok+ESW0xy5pjHVefR1R0iLNo0bnqHcFovY4JtuhCaVaxDpQm9fGU7sfowVBsHM
         ubEvOCdbI9+7VpN0w5B9z44WWta1S73KOk6UZ75HPcXMnpwRDe62eGZ9a7jho0iel+cB
         GKlQ==
X-Gm-Message-State: AFuF++kUWmVbsik5IULlcYmWXlIB+V+4SeyoudhxRvLxxq8Yd/sG1Y2p
	+Duh5cz1m44QdRXuPmqXX+GoML80e92KDN63GnZVH0z2GWV14IiSzEcdHO3juBQ8it5PmYZ19qW
	HO+ssGstZzg0P9oZSzxgYLxikYIZHCkFSMmFDJpKkUFaUcU3n76JcGayLTpSP8Fs5
X-Gm-Gg: AR+sD11+rvwXlBeNb/ljRWZe1y1n1sn/od24I2BQabsRrktxa6smhDF8iIMG+CWgf4J
	weFTytiZ8tPQb5BkTr4mtAEwhqcxi0RazIBcOCx44VDTGyZkv/WMTOZG82e78QfB/oeXrMb3nL3
	xVXxzRrSToUqomUXKJGVg2R7qfh0GwuvWL1mFJaxePgRvLurTqk6HVkNYeTG43fapd79bixofZK
	17iSndeeOHN/eITifNsBNwvuUkXsMPO7drI9q3Dy9qoT5LGFDbpLIBuQ3Ucgk0OfbPO9ffsg8Q/
	B9bHOtjXPszck2eiIzvI0b9ph+FJ8hAi4G8JjBbjERWDRsSq7owY5EA9r4qLv/VhW6LxQi8yeXj
	KVvJW8l6yaQPWHP/yknGJQ28=
X-Received: by 2002:ac8:7f93:0:b0:52d:6c37:6853 with SMTP id d75a77b69052e-52fb9490521mr182978591cf.16.1788033229335;
        Sat, 29 Aug 2026 12:53:49 -0700 (PDT)
X-Received: by 2002:ac8:7f93:0:b0:52d:6c37:6853 with SMTP id d75a77b69052e-52fb9490521mr182978251cf.16.1788033228798;
        Sat, 29 Aug 2026 12:53:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:22 +0200
Subject: [PATCH 6/6] dtc: dt-check-style: Check for indentation also in
 continued lines of bindings example
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-6-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q4xOG+7CJmOJ9HgHFoiC99hD/Y1Ja8xpzFRhtIWs8pA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzi4kK2WK0hmKDhJ+9pPyc/G4IifUG/9KYa7E
 hNdiRjjFMeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4uAAKCRDBN2bmhouD
 15L8D/9ivhC+vXPLKgFj4FfvkPAdj4m9Hr5qffUfAj3ThVmq8cyafZT60dcLxaTgM2Oli0SK4V5
 GxDXqCFTVuv0qtUR3GPuWVL78yHf6IlK1UXzm61TTAUHBkER6+i2WRiE4sYkTCM4P6gVBl2e3n/
 nu4JOOz4BNbbfbn9tteZ09a936t/jmMtgq2Hu0lrdhlpbkPlK4BX5ki/c+95JjK6Jwcb130nyr6
 mNlbyy+2/E8Ymdvx8xv35TsV18rx01vsaGZN65fUDaAKuw6+Y/JmVpg40zGNS109JwB0Jc7B/A9
 c6JAru/Ru9lQW/bZ2g6XPBNynwT1nnDlcXf/bil9NKaGKwU+kqbQptG1DLgPhR7Y+HgLyFkWT1d
 V+SgjvDee5kzQrR3pJ1DPyqn/JEI1z4l9Y+S4iF7td6rAAT9a1BN+BdsVmNDlm+37jpnLg1lva8
 BOm6sOaLMUK8TFcTK5GeFtnuXlZOOl+U+47GcewOxRD6HpDODUcL88BQ/HaVnA6SV+jTO/VapCB
 SFlve8ql5Eue4VdAhwELR8oG4v7xdQSd3kkSJ/rZXft4yDpSlbwGiVcMUt1pjy38pbw7W4zbjPl
 JBeLmd98woNrGpYuOzdxf+fN4mNw6zNS1FZk+ZO+XWnbNCXHMmcoXqL21e/BagX852Gt1om1gp8
 mMNIUOdamLg3obQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: RmOgVNIjSB2nlKQ90HirLaeuXtjKpLKW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfXwJsigmCo++oo
 03W2Isa5hvpfISHrJJj86eH59BTAO9kk1fPXyKGKgGjktR0LkT8mKDWYNAtpHQBpLkKnT6GbYas
 vTcjkgDkBHU53dj/eA0vvvbJaLGCGDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX6tLQQCLSJSNV
 4nafTOoPJE7Huq3yGaJqxQ0JeGWP7K2Akd3RcnEG556FSdI88xbQewgTT6E6QxFynFFW3dCq8cg
 jmwybX4MukqN3oCpnDjdDN8cTSZBcAoDVkC8MuCoUZakbjAoDO+x3F148VUGDBoTP+4hGoJmh5n
 a+4+s3DWepymPG6v0I4R7uZ+hGg2qV9/0v1oBjXtNVYgj0vBlJ8/tWtBEPUq20XcKJuyXP5tyPy
 xsItWRra5b1xYPKrNDFHKWo4MRMn7qK+1iwSWljTbKMqMImhrTW3sT4TihOhhwDl7LpB7Wm7tbC
 OfYIhjN3YFwMyQ1RFHcCKRS7j2jbCBUsHqvqGe9CPUkTeqmhD+Q+JzM5WkpyBm+vv2mndJXGHZG
 zKRFoOZ1qnqtWyhbhAZds/cMpAb+cuFACT96ackRV/vVOfJktsz8HGgTzMaCjgzFdlns+eeAMd2
 WLxaaxzhizUnY+XwOjQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9338ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j2IC0oPSmSx7qzX_OycA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RmOgVNIjSB2nlKQ90HirLaeuXtjKpLKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290172

Add missing code in check_tab_in_yaml_example() for example in the
bindings to apply the same rule of discouraged tab character also for
continued lines (iterating over all DtsLines is not enough).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                        | 3 +++
 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml          | 2 ++
 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt | 1 +
 3 files changed, 6 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index dc5a8ee23d68..0ebbe658b893 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -959,6 +959,9 @@ def check_tab_in_yaml_example(ctx):
             continue
         if '\t' in dl.raw:
             yield (dl.lineno, 'tab character not allowed in DTS example')
+        for cont in dl.continuations:
+            if '\t' in cont.raw:
+                yield (cont.lineno, 'tab character not allowed in DTS example')
 
 
 def check_trailing_whitespace(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
index c25a0d1a999e..4f76188b5e23 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
@@ -26,4 +26,6 @@ examples:
     device@1000 {
     	   compatible = "example,test-mixed";
         reg = <0x1000 0x100>;
+        clocks = <1>,
+    	           <2>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index bc3fc3cf00cc..442f21f90e83 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,2 +1,3 @@
 # mode=relaxed
 bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-yaml] tab character not allowed in DTS example
+bad/yaml-mixed-indent.yaml:30: example 0 [tab-in-yaml] tab character not allowed in DTS example

-- 
2.53.0

