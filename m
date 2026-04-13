Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA83B27E5
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071822; cv=none; b=WwKGu3g+BBaMnwn9zN0lSXb5ct5YLk1IL9/MI0kUGgPSFPJNOSm63zMnYg52DBYQfMnKyfIUGENkfTL9Sqd+pchOTVdMkhI64HmhnN0Wx+eRNmN/8/wIBvtsJ6awOl2CHTzuHwkBJCmyXfPAx1QhA24tv4NcDXC/wn22ddCernY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071822; c=relaxed/simple;
	bh=yft5KZ9R1auRJE/A5VwABKRhpqm2vi3F6M7Ng9rvmaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXTYppP6hXCM/Q1NKfUM6+1YxxMISohgNUBNyuOQF+vp5SI4O+16pondBk2KqkT7rlyPjpZP5/7taRgiL0rdwqP9Rhwl/2PkEvnpdpwDuY6odMlWdCFILWJ1fQON5jfEs1xBhSDVkJGW+Zzhw0A0q9ZKzI11p+wcUBeCd2IK9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq3EKPv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfRm6fWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq3EKPv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfRm6fWi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7SBRr1463124
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O2+T2YIzvBr
	pdMax7213av6/Esab10jipDl7iL6z/M8=; b=Kq3EKPv/RSZaKHAr1vSddr7AfxK
	XAaw/LXXUjma0rRg5ByJjCNAffG28pH69+LlHasLV3O6QZ45vd/pVJZnrIBGoZ7/
	TMVLhLBBJpsYPJnvYOrgkt1NbG0rex0hsobGwMBFwhHwtFs4G/Kz8s/3L4tGpo0P
	JppRXUtYt51LwabN4H03vIakdy5A5jjp5JTGb9EebxrDLAGl9wbn0jzjdyTsoJ/0
	kfCwGL0fhgYoelNezHwOjS5P1tVuZmrOSA6gQTqOf8J7VInVoeCz92JBB1AKv7y3
	A3E6deGydTXO2qvR0oHvzpAxsPs0p798qIsJPyldFUCQJAE0eRDLYrTPLhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvmu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:16:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so740416eec.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071819; x=1776676619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2+T2YIzvBrpdMax7213av6/Esab10jipDl7iL6z/M8=;
        b=DfRm6fWi7sRyUcUzeDSXTldsKY8q0VjvnN+NqT4mOfRtkB3ZlLsKH8pxg7RaNvBBcS
         wMJUoUQ07kcsQA++51nU8p5HFJINY8MTTYvREdQsey+BpJ0/rdSW0gkb/5AOtP1kJVxC
         dTqeRv6ukAlRf2J/GLB+Tz68BEYuu7thB6R2grVDyzK8Cr08m7O8TO7wXN9M5FuiFWRM
         pzCFUjn/UiGI53h8Qnrm3jMr602ul2JOB5oQSXZfQQ4EokYBqAHZmCaf0lNVWGpuwPdb
         tCyq66CEP9MlqPw7u0+BIh8s2+tn0705n8gkNPNJmjWMMualO1RnLxT+jm9+W0uZ39gz
         L0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071819; x=1776676619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2+T2YIzvBrpdMax7213av6/Esab10jipDl7iL6z/M8=;
        b=tUH0pAR6lnqb4nvaDyDZHdPZtyqzCslJNwHDIQHiPD+icom9jPD7hTfljHQ83kqRKh
         v+x9+P84IXNsVB3FQHdEwobpbtwZQ90hVzLBRsK3JFsb6M1TEcCXs8yCV+0zHOgQ5yvb
         RT9tah1YXJW8bvvDb8YHjX8fuMZRdW1hJYzZN2WG1kMWqdIGfsn1AtENaVGdtrtKxTnj
         UzQTyVHFbR8AKnmApk9ZKTVzJ3YYR+wLe7x+M+DUAcENQHa1ZiiJHXiL0F73fdEhflJC
         Xxv73b881rGLa9kuk1JMBHEqMo2m7X54K4wrk+oszR7CRDCJfa2q2AKeR6Dn9i2B7LsA
         97fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ok6p6Y2e3lxfn54wTEarzS62h9AOZ5VORu4bspkI/cIitTPYY1gwD7Xl+lxT001+GkAWQ2yVxFGOd@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbiDTaTthFiwh3/tyz2/tOoRTkBPgs0wu0i8pSp0xOnrG5fCY
	TOjlkQFSFtgExSGO7pa2YMaoWaSSfHXLh4mK/165y3zGTMK2qHnX8WUN4Z/RffiGGf0JSHNUnVB
	eKuwQ1/eAeEA7IjRRCzFex9YQUARzZXVFixgkEOetifIsVuCXiEcP/hxDHK+y8Y/U
X-Gm-Gg: AeBDievt7ewxv4B8C93On9RGujX66lWrjZpDWO4Rv5+cKzVd/tyoXCn/rbzCwlJmbMm
	i27ZZy8thCpJ2JRs8NlF6em6a2pVKVCyeTtYwXU2bqhx2akUAQS/DxP63/uh5CJiPfsIn+CTxHw
	AeIK+zhzHyONqbTQrwmwcgeHLNY9tXlauPymI419TSd+TCGB9RF3f2tQlQw4wWoIwW1GU0N78bG
	kCOK/6JHOOteMXVjkUdNFGhhpZmNNfd6fpnRDUQcu2+uYYxK3pNWS0M4eNjHgN4fRXtR6dXvRLc
	kVYh+dhPQw4CqgRSzHzgjuh9G+v9EPzVidLA0ycMX3ODAGYBZUSALt0VX5KBL3cBCUQBd8z9YS3
	8l940Dc9aL5jEhqdxowEr6TEQnDGbXlPOzTnD7E8cjVTgK8oZtuDWS6OEsGL9lscq/QCvvjzC6Z
	6lkmoNew==
X-Received: by 2002:a05:7300:dc13:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2d586992571mr6653818eec.11.1776071818850;
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
X-Received: by 2002:a05:7300:dc13:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2d586992571mr6653791eec.11.1776071818330;
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4 compatible
Date: Mon, 13 Apr 2026 17:16:24 +0800
Message-ID: <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UGnOzanmVBqm0RQOhKGczv6tQwxFn9Cg
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcb48b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F5q7cko3O1bYObIGLI0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: UGnOzanmVBqm0RQOhKGczv6tQwxFn9Cg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX0t1hIEFjXqTy
 Hr8RiMYOYBS6VUROiFz0Vbyj4OYJurfyEOnqJxsrqXecujmsr6prbSM4a/3UAnYObJLQrMy7DpC
 UP3QyR0+RW3t3RMEyOMGMrecxvgezZN50DUoLzGnja/1ohO2X9P+RTGNHYZ63fnIaVPMsx8Cy0y
 zAlcVCMTyhm6ucIQ2zs3UkKK/BPADRfGnFHEnXLg2ENu06Nqpr++sNV29w9lgEbo8d1pFB5A1Df
 vC9CLUfN5Q9AP72tl7Blb1thOqD/OFGwRsxZZnL+YaC78K5c85hGH+ojfzUVjlFUOprMb/kI9qH
 T3E9auWRUnyfInSn3MZTZUXQIYDK9wF6e8L6vqiv64dG0Uet5l294LRJsVQwQYclCipD0ODn34A
 YneICnXKeIVUP8e8+6ykEkqZESifCvriUgFikBYmWy1cXcJA7dV/ahZiVWIcsb8QH25FtUpCORl
 3qLK1+ScO3IjKm1Ndwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090

It seems that compatible qcom,oryon-1-4 was accidentally dropped during
the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
Restore it.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 471902ddbb65..5f5ff5e51e51 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -222,6 +222,7 @@ properties:
           - qcom,oryon-1-1
           - qcom,oryon-1-2
           - qcom,oryon-1-3
+          - qcom,oryon-1-4
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0

