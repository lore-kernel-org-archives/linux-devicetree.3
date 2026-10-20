Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478246;
	b=BCto/YGqZky5aExPhnZZzBqAfrR+G8NZOp/qepReoRI1hhOJhueoRwxyzGH2nMqqKs+J
	 TSJEc9ZnTfeYh+8kKKGZldTXbEsqUTNaGo/UYNp6mQMXSUw3PiCfPrmLupjkWgrfEujjE
	 /TJ8bXI0eagYW4ryOdPeVQqB8gTRYQwfwez9EilDcrGsXpwjN5hn4w7e0echmm6l3ZVCH
	 3ygewuyCkWZMtJQiciU4WH0xU3OrG7AGJne3VyVyC0q/LOseRV9L60g879VPwZZDe6mMu
	 DcskolZYgaueIm61809DL9iUMO9pjZYT0W+OqNAJW387lA+3v4BHGAsnWzZdMiWLh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
	b=dxzEM9CxmDpXO+f7CuDkd/BJjt8WY7/ksvVUcf6IGglN92EYDtWDwWEpp6yYAUnhvEu1
	 fXHKnGYDDeYF70JMp5UxgGm0ZP67wobl8R/5qotapHHJiFsdZDLf8Ff6qXY6uo/pKPc+e
	 cYU7/ZFWAWf8RlSvX20E2qzM41h87O2EP5iCjsQ0lXOeUYDwLy/9Rr5INPxv+YFWnqOWq
	 tm68OG7GFdLSGBDqpHrM0PCkFTNXKV4++pptF99MUWR4SWN0cgInx+CdXhYX8q3tC9Qul
	 nX+xDn+X5NHaDAMN7GF/TBtu+Jd+XItmwDh6LpGsGU62wnOVm4AGyjHTvLvqj2KInuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAC606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FAC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On90Te8n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LaByuWPR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tFxA620201
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9
	ZL/nzZpw=; b=On90Te8nj7S+0SNpk4PUbooliAGaPPjvwOxNdKqK1dPomA43X4q
	fk2IFUS7vHGQsx93zXVeCh+ZGBD2brS6Tmt76mR1IiS/yVrlAc1WZ07suQhutdvS
	6O11LrKft2Sd30pv7x3V7vb4AJ6Dmjo7A2TNWjKg44aaODYYMSBy6dfl4N97Nf3Z
	vQj3HE9u9jZzNCnvV1nU4ppgko6+aHEHuAF88zSNZUnE++rsR2MqmHucRZq7l/Nq
	2RbgBiD8bLnZsoHPt2qnN7GlczExtjAYON9Zei35NTbAPDE0+0OhR8EzBaPTLa8Z
	gAFzeZxcQABt5tPfYDpMOcDDFCRhKsLkBgw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ns5c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:37:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-186c1aae818so4287479c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792478244; x=1793083044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=LaByuWPRQmp/08VCDyjWZo4VWcA5gg36z+bxzO7ehKPwPXhRDPwwGTPVmh0mJZ3rp4
         EfD7ko0UEIM274kNw8x95I9D6yrkrShu20Cwxxus53qUvpNTkqI+M44gKLY6FFtmNJMw
         9NystLBGW1wy+YDIi6VPTPr2hrUWcLjfH0C6+iRSfJqTdd0valsTVKH6pejaOYm2wLCo
         0ax2+Oo02WZjNgyLwmWALIO5KehE31bL5VwJRdcELYgf88+3v2aDCvxN1vBKmNukVKYP
         M1eT4fvxt4Uknnle4BNEgrjS8o/+tCEElss4bwWhIR1Nh6CNkOJlMG1lN+lncvvSEhRj
         v3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478244; x=1793083044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/pX7Qmkq+FsXAjiUnGVQ0SAZLUPJR8oQW9ZL/nzZpw=;
        b=F8mxEwMJMcGmZvUtVpk3yI098YWvxkFYwl4cqhn+MzgqWfW30H3J4vXoKfHhikHvY3
         iqS5YDuR7M0+qOhUDEPBGmsRXZQ4CTbRW4rxgXe8gvNmdd2zzg2J4XCMrwATkLUxonag
         pkKJZ5aUCBfQ0jnxardnJOuP4Qv4HcRw1Y2cI2nQfGp9PAm0EVz7605dKWXvXdRVfRj2
         vMmMRCkVGrF/HUyLbLZ7D5AWi+pSWUN1HxVz+hU6drQPwTJPKeOBsprXSxh1lzBFLX4G
         ydldfxV0GlAJg7bazlv6inr30Cdxl+1I+vLL+sBf2ojfLbQY2WBexJ7M0UVAvCm0br8c
         b+8A==
X-Forwarded-Encrypted: i=1; AKwUvBxHlHRRE2FzYLyR+BxzPwr97UCY7AO5cFGH3jnjogne0tKgIYYlxok3Jun1llns3QwSIdmegPy17tMn@vger.kernel.org
X-Gm-Message-State: AFq9FYKh5HjlYM4NEDC/y9qwb2exi1GU7EBeW6ZJV0lDcwLGzwUykcC6
	WuJJQ/r9SMRvvq4x2XtjNeabsrzRHoUcYnKrk20ddj+6F/nhuaWhmsnq0HPtbeID0RJskUI5x6F
	cznrij9FBA2H6d34z4ZiRIqvBQlnQfkPkmG8ivDBLcZHIti1K2hO+r7JfSPzsQgk1
X-Gm-Gg: AYBFou3XZafJmV4rVsR9CLdR1fCTf8W3ArPaGALg8KC3Hn0NZUfpIUrHkH5pCbfhnvE
	3FzMZmKk+5Lr31SIZihKT/nCKYAFZsmy8ZJ2Z4WyOS5aQj0BReBqgYuLrneb67tsdAX2XPG41Vx
	7J7hvloCaocPyFsIg1AsY3v8Dwf7JgQPVnk249ydi8JZuBJsj0XbZRyvOk7bVzWzotMX5Zv1KmK
	3Y06PWNaOGeYyp5u9Eyzr56NaGPnHR8jYvluTtMLvSXh8PbcPObLBzrCy9YVqVcH5rOGpc4CFbj
	FuOR3O11IeYZf9KWCEWL14EJPdMdDcSrBBoNi6pnYgCH34TkRrytux71Hvby0sy82yLbRubJ6ok
	lDZgAyKFYDCEqYtu1DqxNJWStWq+q7N/k5Ehk/2nhDNWZMA==
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254369c88.47.1792478243748;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:20b0:147:9ad0:cf10 with SMTP id a92af1059eb24-18514cf32d5mr15254342c88.47.1792478243242;
        Mon, 19 Oct 2026 23:37:23 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm30791906c88.8.2026.10.19.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:37:22 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power domains
Date: Mon, 19 Oct 2026 23:37:18 -0700
Message-ID: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfXwcpa9yXDqQRR
 W85RvzNODHO761sNu4nH2uL37uKJEbS5Cak2ZssvHp0sn+xNKn4Ru21nIH7KKPtGs7WNUt61iNQ
 w8Wq3FHKiYaUXPgcxlDF27vdg229tBE=
X-Proofpoint-GUID: gTBTfi39rR2IDsqpUvbHcH_jqBjfDi_H
X-Proofpoint-ORIG-GUID: gTBTfi39rR2IDsqpUvbHcH_jqBjfDi_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNiBTYWx0ZWRfX6GSxWXVblBop
 MwKgEQU69tCtkJXdKjytNzHRxT2hoknbxasQeN5ZY4vF6CbOCTmZ7hOZFRvCEI3QNRxVcvhtvAk
 yAl/vIXwf3y42z0+KB1c9TioAvDy44RkVNgpn7/NJLXV1sHQ+kr5J3HALkrJDuOZKLzyQ3wurEH
 FhGQ2eyWSRXWBdiOVvEvxPWT1o8yv74nRC9ISLRJPeHk+qy7VFOxmtTZWEmbUo20KGihEhVUtA5
 McSds2rpGphHeePauM9LmOKUOjXRJZQY3VYrwnC6EY4CQvIcKgQjxmVXHuUcQNvrYqKQpS5HbW9
 itdRhHNntHNtokLKKI9iWaA6iHWpX4HbNxt4kmwxSoam1pnCHFkjedAEkrry/81GHTYPZbDIc08
 0ADKHkQEBois3v6JoF6W6yE607jKfwGzS83TySAk7QcI62sngbrgQkSoYKWxdKxlhNoe9UFl/rq
 FtHK5gFIaqf6qzZ6aCg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad70c24 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zuyij4ZH1eBwXV_bZR4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200026

KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
but both share a single cluster_pd. Even though their domain-idle-state
configurations are identical, sharing one power-domain node means the
kernel's PSCI domain idle refcounting merges both clusters together,
preventing either cluster from entering idle independently.

Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
tracked separately by the PSCI domain idle logic.

Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..5428f3f44361 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -273,53 +273,59 @@ psci {
 
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster0_pd>;
 			domain-idle-states = <&cluster0_c4>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&cluster_pd>;
+			power-domains = <&cluster1_pd>;
 			domain-idle-states = <&cluster1_c4>;
 		};
 
-		cluster_pd: power-domain-cluster {
+		cluster0_pd: power-domain-cluster0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_cl5>;
+			power-domains = <&system_pd>;
+		};
+
+		cluster1_pd: power-domain-cluster1 {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_cl5>;
 			power-domains = <&system_pd>;
-- 
2.43.0

