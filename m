Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85A2F25F5
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645824; cv=none; b=UjMEwUw6HYEd4zkLznZAW9cibXu+9Z1d3r2eh0mwdAUy6ZIS0y9zjO0P1WL8PK5DME+bk4SeZcgDmSM7nCYAoVYRrhTVfj53ENTPQqLExoQHoXg+P6Qp2lo1fhTN/q8oz1TgmTf+31k6ApoR7DzMwh1y7KNU/LNHNy5QqnPqvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645824; c=relaxed/simple;
	bh=skCGxOgaz7scnCaEUfPg3Bw6m/3s2NMMlyoC1wxppBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=crSM3aef9+Bw8bWDhnjVeFns/9EMsfEmO4/sFeU/efLEd+E9PPWk5GV/z9cQebcpExnWRIPnCluSRwjjAdiaeGJPK7iUEAN0slg5XxAr5XWYsNgPdQVG78yC3kIMfdv0qD/9E7M0hQndZwFJigyEAgcQkXIeQzHjWLk7140mLbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb0yeSzU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyNUSiWd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb0yeSzU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyNUSiWd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O5brvE2813854
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=reEe2mjqmOyuqKZeF/4uc0
	HbKJY/S/Q3G/fnmXlp3uI=; b=gb0yeSzUeOZJDL9TQiiEWCJpgd95YzZVtyoir6
	gAbiaS32KpH6yVzYNUQmQJTtOLiP2oWRoN7CqkjKCGEdL4ELfXCm8Mz6pDi6N3MR
	47v6/0Fwf33q1o4KGe2s02oj5VtONsbDjRPdHtngBkm/qF5Tm7s10WHIv4C6B0Lw
	Zn1St00YX/4dVzYTOdnxZoFtheH80czy+PHghN2BnhpJIe10wzmIHZ0OMy+n8tUw
	+Co4wZAJZXXKBa4Fi3CznFBW7mGYov+6gxPGjlJRgReoK+0THTKO99M4OYkHLDLH
	GipEgIizdIo3KxmbpJBWfGHgvjYvo3yDJZgXpAsaqQyc/bWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9kk2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:03:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so9704488a91.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779645822; x=1780250622; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=reEe2mjqmOyuqKZeF/4uc0HbKJY/S/Q3G/fnmXlp3uI=;
        b=MyNUSiWdrDOTeV1aQinOhBgxIXi8JMibhwzTMnY/w6Q1+1bf89zXNO1+p3u+yUSUsK
         7ep/FvcuA70h2zbxmoWuxJ6l7bn8QTdV9ZRpZCKlL0UBteIB6hA2oi9PrydH3XKV5ben
         8szSkrdaJ2ZA/EddMI9+ZMMco8M15+tmKpRs7mFxyFsALoWLdq/iTKzIFqMe6sjaf3Ob
         p8Q3MLSdtVPME3AcXeQRBlanDJjFzqQm5+3eOxdBd0wYEP/mMKdMaVtRCszeO69GA3UC
         xhCQmfQMfYa+FC5069clakkhAiljk1FAUUjz/nkKVQsz6eAP5KodlRAiunCiGXXU2KoN
         /AKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645822; x=1780250622;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reEe2mjqmOyuqKZeF/4uc0HbKJY/S/Q3G/fnmXlp3uI=;
        b=YOR8dUj63/DDArbwLX8AmA3oeS91sqNEroFUEDewh1CBk0d+TB8mXPzcxQwPH+r50H
         FVc8W5B4HNFN9G2Q3YG7knsC4MT9WytRqtnw2km/uskrFQvF49OHyAQY0gNT7z/hY/wp
         ka6G8QqbGxjNBkMkzGjEwcgQLMsJ9nAos6Gr57RNFCEEdu1bRnI5E9/cb0UHAR8sIv2P
         tI6WpyH6gi1QuUJyaZsPL8Ep0WJ3cOiZr3K5Klw657hyDKE9M6hKVQ9l79DHHtq2XlOT
         HSutFHDeCK6ufWqKtHJT9TisKqpJQph3/r5rKL/csTvh+HPxxAFC3qT7hiKVif0c0hhS
         N0YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8S5CqkFAsFv18G6Rp03hyfQ/evqQnBnWNRDiEb+ZMQ//JEk6v40GLXYRFCIFPzQ+ZhoF91tOeeDVx0@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNL7RA/9nNXIFgueDQEM/IjT6INetCQ+ORY34f4xuIdYaJrDx
	XhRP+Fn7CNNe9zyBMb8z9fQatMMOYVy3O+PUpWvMRVy3f4E+yaUd+CVx5mPSPogqBwsHPDtvtIp
	TfdrnrfmWqItYJ79Vl7m0jdeVgeS1vgcTSS6kQmVBYf0Yyfh+if/h5vuM4fViejIq
X-Gm-Gg: Acq92OF1SbnB3X/sKxVE+W40CkSnRCp34WWbWAaAqR+edg8YQOo+DlljLbPu/Ie6wXA
	Wyie7kPjc5F8Fwk2/d9BChGJlLT3SSGcr6xD1Zyb8UHffNi9Sheav4h/DQAh9aevNFljkWnjsWX
	8bHg/Olo2cidq/PCb6CzbCe4gFvEqRrJHYKVxBCCQkHvv3slK/5NzHZ0Vt08R0z8nhPqhnzjWJ6
	rtjoG1+Hkjl+uB2JBIYrwtZczsTgSdfBP1o4/eW51oGXEKeveWqQcdzhxGd0rJW2EahfqqY6PZL
	8JPy4rMcFPyiaA85pt/JHWlLyHaW9XyKaRhDYRBQRy0jQ6FqmQ2A8fExaxX+sZSvrUJMCofzOnQ
	O/Lvlld/oNcw50QZ5bTTNPVJpEXVfTM78WFZ/+LShmwnH
X-Received: by 2002:a17:90b:238e:b0:36a:7127:d9a7 with SMTP id 98e67ed59e1d1-36a7127e0c5mr6982259a91.14.1779645821860;
        Sun, 24 May 2026 11:03:41 -0700 (PDT)
X-Received: by 2002:a17:90b:238e:b0:36a:7127:d9a7 with SMTP id 98e67ed59e1d1-36a7127e0c5mr6982250a91.14.1779645821350;
        Sun, 24 May 2026 11:03:41 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a726348e2sm7252659a91.2.2026.05.24.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:03:40 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Sun, 24 May 2026 18:03:34 +0000
Message-Id: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHY9E2oC/yXMQQrCMBBA0auUWTcQx0TEq0gJSZzYqVJLphUh5
 O6NunyL/wsIZSaBS1cg05uFX3PDoe8gjn6+k+JbM6DGk7ZolIz8yN7RIuKeR2URfSKTwjlZaNG
 SKfHnN7wOf8sWJorr9wK17hyJRKtyAAAA
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: 1UxUE9BIHwsfofTEW6-quD5nJTUmqYTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4MSBTYWx0ZWRfX2P7AFLSGRhFR
 YzJCx3dsVcPoA3ygfAT7KFtdd81E8idgiv37ghP1G2/ORrM4EosC6vwGZooKHL5mnfqS9z0BtKv
 ZmLQOLTPF+/aHNhpVgI++HZUeWuVgCjqyyVSFy8pGEn1Ltoy7TC45izGf/UGdnxRCOo5a4OGO9+
 YQGOVkClVKeUPTOLTcZWAQGBjtqtbU6zU6qW+9F6U2chGedXfmqHxaRf/WXzEM2b2Y+F6yu49IQ
 gjSKxKZDnZw7yJiC9RrAhFaVlHLnmRwVVPaQlWag/bi606iRECEz4nMpDR7GiqM3sskPm7Y0UYg
 AQl1QzegQem9QWNum9VyXQHuzZK7ujyVApiTIRnvuLez6WFMkef99gPpSNLPH/QmcDJtkjxGozy
 vz1NXHXtplj6who/SGel8bfMLjhqyvv8OD7QwC50nzdZ+/4g6lEfDJDRRw4EWKaSypEfey41F6x
 rkNQ2jVCcTM6ctVsgdA==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a133d7e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pzfQcldl9xs5PnSv4NYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 1UxUE9BIHwsfofTEW6-quD5nJTUmqYTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240181

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new dt-bindings and compatible to represent this constrained
variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,shikra-epss-l3: Add EPSS L3 DT binding
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../bindings/interconnect/qcom,shikra-epss-l3.yaml | 60 ++++++++++++++++++++++
 drivers/interconnect/qcom/osm-l3.c                 | 16 +++++-
 2 files changed, 75 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

