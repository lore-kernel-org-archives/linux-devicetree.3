Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981769;
	b=FYKyaQzO5GxLXomXxHmjNE4j0cm796SaXocGjl1CFbj4YHWBh/IlGma4DOhe+KZK94ej
	 Yod8ZVJhjfPu35AqR8AMsNB+92yiK149QSEOeIxZnyaZnaHNGyiAQCRkBrhbOq5ATkvZZ
	 obSS9t6ag1zpVGuRg0y3F8SlGxwfdw4p/+TX8Tks+o/6eccUKIZBcfRkj/K2Pu5r8tGrw
	 kP8/XhWHoYEqiWfNhlnvHH1ZRlTCFoXzHUv2naW/0rSNtp7GnyHn2Zr7re/iNLgjx7HR8
	 BTtWnyyd8+M2ZBvzt2Vq5wxGW85alA21D6LwHpG74bUs2GnAaFtdUSofACmJqaxnRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
	b=D1FkNItyNU3XywRzhjKOK00xM5p6ikR+u3VRV/1lYnAZVZPUB4S5SjfbY6tZgsTlk8RE
	 WMqcHzN0YT+TlCfNaEu7B5OOfhi3sx4brkw/PYdSLvgbZyKVKbA1Br23JyJ2oxFT+78RM
	 I3mU0gfGK6yzYJljjy4TjFewRwG2aybUx5TFdeTwk4x65CZhlO10w3UwiVVfTMY6xEZlP
	 k6UPY/zFbLyJYeuEUFZ/0IsW3lajiDXmn3E3E87IAweU2iAgDLqvESRSq9e7qwHBqsRc4
	 0WWDRrSRFhyvvjpP2hxA9mLs5Bs2WlWrO3ku4TxoeSiDmaYzum1NdPg2YKYh9iIXLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RIP/CT5c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3F606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RIP/CT5c
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxPI1430530
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=; b=ewpyY2E1UyI/b6Um
	nsb7nQHTdaVRCIhUELeds7G5Dd64qm/SDFp0ssoMM76QMWyvOoYdwXS/bO0Ls6eT
	SreOaoeRVu9R2L/3/OXoM1jKEBuPUVwie5rNsvrsdsdUTQ2EljUzzXK4EVf2r9AF
	l+pEAnJe7ReIrnkExkLQjIZV4nL+oGtkuf6j2vmLaTG3zeLLfj0ddUIwMUbCCm+a
	b8+0tW4yJ5b1Db0CI3j5M3W+1tyJ0tXHY9u8ZwaqJZcMDPp58ZiEht3kQ9NFqt8L
	zsVyjdVPI8LKoJtkHL/7zHnM8m1fT20MyjAnmeW/L58YrrX4lBwONiMf1mQT9JeZ
	gVqWuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91f5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efad644688so5630105ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981768; x=1795586568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=RIP/CT5ctsHrKe9X97iMSdBLkUuGzK0e6JVdqYKvuo7cyYUA1+zrfhSYBi3WvkKPVS
         TBcAFgtpiVvtOA7eXRa4tbw0k4++W1A2IKmWIw94pO6rW/67oAPVQvK64CqBsNAq9hxk
         De11c3c2oD9YOCi2G51hxND/bJ3eI8XgMex1rNSesfgSQv5hgbNvy0lWy1zsQsXVfQNo
         4C0FeUTWPU7Ucacbr8IoFg13nPhU6rhueyXt2NuWrsTZmGr4bOwKoZIA4L1OgL7SXPtL
         0sHtvXa8V8bLE0h5d59sLWNuRwd+Jhysvbaza8hsDVuwAlpAAQ1dRgOPjP7n4vcqODtU
         qN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981768; x=1795586568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=T6bJfZn0hqJQrUBw2/wfZaIJw/VT5VOIwgPLLzDZPQIORWcjmXXiDsDBc5d965P526
         v2rz0cSBm+6Grhuy4Hfz62YC2IgmPn48eQ3ulHAh8OkCXhNFWAWPpdJyx8wh4dnqPc30
         6owyklaDNNj2BHTSicTp3Ublu9gx6vwMAifXdJbvIq915D1xoX4mHCIHrf5nmD0WfYVh
         UpvzcqJUGCY8ZDyaorYqG/swv0ekOSWhbSH46wLKauDb5AaX8WkDvyqtHzO+nrV59jb3
         5HBN07F/IqiHF1G2y+rxi2q6Ep90yWRJRWI9bOBmir1hpwiEcZoscw7sNIVGC8y/zN52
         xG5Q==
X-Forwarded-Encrypted: i=1; AL+hErGw6n3ycjeuAtJQSkC73URbllGJhiBYIw7usJXj6W2JS9mcjXS246sDifgUr7gcuNOJzGaoyVl4nOuc@vger.kernel.org
X-Gm-Message-State: APuU4Z9dRDxRYEVNoq4Ak7+X3lzPVWYaXZtQ5B4ttRYqc7742sVicaVh
	hGr+m/gCIvi0pu0W9TTgJnelkhT8sh0/6LtRXYdv4ce5L1zgub+nJdDN/pPvVqKzARl0ChIamc8
	g9NGGZOe6jyPpi+OLZrhdYKmf0ZlYPI9uIaH+4ktUhgAMJ3hYEed8/eOn3lXNKMYQ
X-Gm-Gg: AZFdTZdfiu22738XZGXoJmogPGcwGzBwGGnhM1RCUiKwr3BD1kjQ+9NN05BqHguj/uk
	7+R00J7CXJd6zWy+7kgVorAHpOGugds+v3R72R/7qzIuiB3DlaizyidwxTaFafAOPupldgA3Zw/
	nOydiPZtcalBhkTHc6AY9mxdVDVhzW2/qZuWDEVw4IB2rujVI+iYlZozt0hSjCzdsFcOSRTavsB
	9l/sW/YUZmDSsbgpVmyFdRkR3i1J913PB604sAlAjrJW/vKRgkH3+iHrSllYwZYH9t5W1XDiy7K
	b2F0+O75NjXHil3nQ4gw7zjG70aDHssELUyXUaPi4cvidPcCsQMV7ijgsVBHc/gwgc4HuXNALZc
	ssukRMzX+j3rmHEkkpiD6GypAr3D/HD+bvnyVDDGiVpw9K9qXr2sOxp8PoBKnVt4Ii7oK1foh3w
	==
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055715ad.15.1794981767690;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055495ad.15.1794981767250;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:32 +0530
Subject: [PATCH 01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn
 function
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-gp_mn_tlmm_support-v1-1-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzmC/zdRqoJwG
 YC+5+4z38nZCjh1KcGH/p277dHyR9ocUaSlPk2wKG9PFTUom5YZ/k7JUWy4bXsSgimTulxYHJ/N
 SYItB9xb+28JHSmUnlffPf4J+RbCKyvPnarRkrerTCAg83HO5UcHBXRTjZmGGYcMc8liGhtYL8I
 2avHfVZUHjsj/uQp1TtcZP5Muni+aMdQ3cEKWMaYZNMvQtyN4d8zjYnqSTXELGI203vv158r24L
 1DT4RKh10xzAcYakHSrmyYhWd0A0OHHW2e2oJ1eOv3qeXDGkJm2KwZL+KasFaW2H/yCaZB5fpV3
 g9ztgxEKImr6uLs7+qJNHhe6gLEjgFsMDihZl+Y4dU8FKElsc9RrcrZIsh3wjRIqlzGQHLk9OpM
 289p4UdZ5eof7i46ay+e7N5ZBEh4xCuFXbZYQZK4HAI3UjttpL1HuYQeTI+yQNMNWxiIwtqpznu
 PD0jbV1FrWaOSIvKZ5Q==
X-Proofpoint-GUID: CVwD02nyK8-xu5R7G3kvhJvVUwpK5rjw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4Cbcvb9gcoai
 EIzzX1gcu9t/lVIl1WU1a0ypX0FASEkd6i9qIRRoY3LzdmnPyohUiRxyw3ww5HxED5dqdgPJW3T
 FYJ8qY6pfZtb2826jXmcaw+MbOQ/8ww=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd3f88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=trGgOxTnYlniadtl7JMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CVwD02nyK8-xu5R7G3kvhJvVUwpK5rjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS8300 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
index 489b41dcc17932ded89d8e0fad0e284e516a6042..3d499516767a4aaca5224b3a4a901ed2a90b3c8e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, emac0_mcg0, emac0_mcg1,
                 emac0_mcg2, emac0_mcg3, emac0_mdc, emac0_mdio, emac0_ptp_aux,
                 emac0_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5,
-                gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
+                gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
                 mdp0_vsync0, mdp0_vsync1, mdp0_vsync3, mdp0_vsync6, mdp0_vsync7,
                 mdp_vsync, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,

-- 
2.34.1

