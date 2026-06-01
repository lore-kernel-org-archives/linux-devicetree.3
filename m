Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C53DD87C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335061; cv=none; b=mwUpcQPzoupggo7lkowFSPSfDNZF9nRMJxg7Kzuj+Wgzy+JvV8QsXYPg1DdA3luMhoGOlkggIyI0kfulL/FVny/OUFhDQGR2yDkkBQWEsGPqgq3Yk/qItgMgd+agEsOBX/+cHuxeCLZEj4MMfSOxCPWrkIBd5mWJkQMjLsRMPl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335061; c=relaxed/simple;
	bh=Zyi6ZGL896jGON4iStDG4HYuocR8SRlTT1GS2O/Ts0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBpznUrzjhg3XE5QWbG/fKkmZBVzivCY0iYZrnWYoDJMCRKNJJBrj0B0NxzJtUZ1Gf8p6K2snSlJ0bI6IzyDzr0kGC9rNZpkrAf+qs/x7i7bohMiducUHkCIMwYBqJKBeQPZpOOcDmoTBVzE4AALdJfaKfUwkgvcp2tlKv7SCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1/rujjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INF6fjem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1/rujjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INF6fjem"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EiaX52740436
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 17:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=; b=B1/rujjM/5EQKr4X
	lUbYrgXgDIX+FCKrQ3Hn3MW3Jfqz4Ita7YYgImO1R461MdboqGxaBNnXvv4lfMK3
	4feFCRAU9eekbl1K8MPkKZzLJ4CpTyHDUB5zw5H4snA/lx3XmfUdd1PfV/o7wkLg
	uD4dd7/OEPyYVHYPdSqR/XkhSI2lZM5Yqp95GnQAwfME0Wm3YSG5+WZV3XfPUzLa
	dmKotEzbUHtcxFCMWEOKxelDomUJjNe/2KgCHp34OdIodaNlK2EOmpWttrK2Zx+G
	MF2WeD8qPX81rGI7yKVB8jMYRUIMbecfiKVXntm7TYXP0X9YkLeaqT/B3ExpfyY7
	KIwvLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqj806-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 17:30:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso47980405ad.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335059; x=1780939859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=;
        b=INF6fjemnrPwc+bbYj5HAnZ41nCzXlwQA/qzUwXrNh939NM3XzEVixIh1Ct7vjc3uP
         RjmzsDCKxwATqXdQJeD0NZcXwvHW/u2ZaJUEeFdpA0ZMDUEH3jz3B3OexZutkovwi6yH
         Marr2B0LykOvmajdET7HM600w8z0PHd/mb0sEcBk3G9EqcTAn66gSroBpNJ7qbMx+VKy
         yG3ZYI9e8Xp1XiNDHRP1x7dIMUeuRVb8GLYmqnv+eLmEL2gYUQpU62eZd6hOKQ6Ue2t6
         CcqXxHl9A4WlNz9PTWoVv+F+twkZ9Ti6sPfOSgJih+4lIy3kS39ten18sQxBpZDbcOGt
         5AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335059; x=1780939859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCwwzgX6X6FAk6K+BEi4rFbrCZI7XpDhhtoZrbnj3PA=;
        b=earpQ4sfg4tDa8SEfaNPfirIr8Z1TsWGrkkiKzsXjFwESTvqcO1K3myBZ233jpD/QZ
         33ATiXy5b+iAQW4hBMvxiuSwqGwWPJIuT9AT0Tme2BWcJJFd13zCROwx2Bhq/Zfxf+WS
         KpXTcCMqzxcfysc+0QSYk5hbo81BWI4Xs7gfgLHKYnwg03bNo/bgbGcWK4zEB7Asl2im
         Z/FNasddujVa7kQNARHR0eaKTjVyWPBMyi75/q+kh30+s3IfAN11MJteGxbQ5yNJhxXb
         QJIn7xubNc+BYD6mia7uy2r8SIltYZiQS6uPeG/B8dHqyX0NQS9E1WLEZoX5eIZ5GS6K
         ELZw==
X-Forwarded-Encrypted: i=1; AFNElJ/HW1zEpJY3Ri6+B3nx47891gJHo0LMX1iVt++80CPB/Dhk9qFu1+jNlYjPN65NUxDXQQq9LY1Uy9mL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BwhWKbS1izrlpdSoUq+XLsVyZAJMD2g0NmRsauEQc+CHYvyA
	pDBngTBfUsmzJqBReR+Tbnf/tVLTVAG4/WN9ocfBzHece61Umw2xMLHKf0MY0VSSwj5kkwuEBaI
	QNn6aHtGD95CFgzJduWuMinzwRrEG0j9+JM10CK8y8pbNnTH0HqDBqP9dQyBFwlGR
X-Gm-Gg: Acq92OGNHpMDgSpr2TWCqmc11dT3xUrDCG2IO9PicTyhFShKxP6ZziqbD0LxjVjXBTE
	46Qc2RuVLzCmCyr+fooGS40CJu9aDFiwAS33LfyFRRNNuxOCA68c50RzdXDkQnW07v2rkirFkWX
	RvFWJlRwnorePPmudDSVEvSmtzpPQm+IHk68Lkmw9pUzINfzH89okespCGRP45MmPT6xpOanZa/
	jEJ2NGEKq6gWHmm3zQJZLasOKkSVBaVtQSkgC+56xzXrg9JiSKjfawOC/bqJ0jGCUlQfc0sFotX
	R9D8220AYtncszqgOVIXhCEdG1w8+qBTgvGfI/bzgvBREeuXvpiWDc6egdp3OxOBAN8e2gUaPhj
	sI9xm9P3TMhE1LiNtqvimvaFwbNsaiXsd4eqFtOghCB+L1BVz46v/QMskp0PNcEYejBs=
X-Received: by 2002:a17:903:94e:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2bf367bd713mr122993545ad.9.1780335059104;
        Mon, 01 Jun 2026 10:30:59 -0700 (PDT)
X-Received: by 2002:a17:903:94e:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2bf367bd713mr122993165ad.9.1780335058650;
        Mon, 01 Jun 2026 10:30:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:30:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 22:59:45 +0530
Subject: [PATCH v2 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
In-Reply-To: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=913;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Zyi6ZGL896jGON4iStDG4HYuocR8SRlTT1GS2O/Ts0g=;
 b=0Cr9XKqiuqEufsk3MnumP89WSaLaGSxg47BTJwEc37C20UjzDgXXyOejYZMYpvYjiWuENKAZk
 9WtrirmnKFNBkPl9gIi+eQg/CY5DJFxT6TFdo6IzLtpLOfTn/diUBhW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 3eCpXS-N2JspW8ZNOsrXOYWlAVuXCuii
X-Proofpoint-GUID: 3eCpXS-N2JspW8ZNOsrXOYWlAVuXCuii
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1dc1d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfX81zmdSiCmQJ9
 5+aCYMtPWL9glW7IbGv1n6NKtvNwLDYyfz4cnpx6Q83o19I1mlhwVVvhuZoukUw+GEEa1tKLlWz
 j2ZreBbVl6hnuYSw29SsrlYzowZaOCfM5LN35LqVQIrGVHqI3S9bLsKuImuaaTnQCpbhMolMclR
 7RW81WepmFYlmhTylWw7aaX3C059OkNuCEdgy2VhXl+yvpPB6dsb8uUk0HJyUzOjoTKH6d0KkBh
 FGT4CZ0QtV3r/7c0LfKbaLbnvfq+tfJG1j6FkMF/KlpVah5rF1KdKIPVDfIPQhzYTW0L87lnEE/
 HHTd9ugey4CWUgP9UzB0/g+J+gRqoMdZ9Fze44WTDg8CL+BU+hqveltKs8eg/ul88Vp4pw6+lKZ
 Pa+e6xn0iTub4PzffoYIz4SqpAfi7pDDZ4byVIcn962DgcRm7rJvsK1zw+VigZR7JkrI7y+bMX/
 HXvLlrDTTWKJ/LkScSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173

PCIe controller present in Eliza SoC is backwards compatible with the
controller present in Eliza SoC. Hence, add the compatible with SM8550
fallback.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 3a94a9c1bb15..98b7e0612410 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,eliza-pcie
               - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650

-- 
2.34.1

