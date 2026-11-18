Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981782;
	b=DdFeMGGbd/1QlPJu9e7JDSc4jaZ74SLQg/Ss9iahfbvVKk7Dv6MX0lfH5VyfnaPToyk4
	 PTJ+DPF69jdU7ATUGj0o4Q70afLL6hZTcC2cbD8JDC5DwnrvdD7KfFQUTx/RD6PS0c0+R
	 HYolInnjCbqkSd1jLfUvB0bxAKNtSmD8vSkOJV+L0lXVA4UPL80zxweH8iUSo7m7DhvPY
	 JXUIBd4Q9PSdZNfh0lmJbouEz4TExh6JO2nFBGO63zfJSxV0ubi2gn5wSXh8Pm7aRmuLk
	 PeSTDEMO9tFVhLnVY6EMEHl8EkXKs8KLJTFfqBgordsw1C00DKkmeKJhHJ0dilKjM+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
	b=3pbcqhMh7PGkefFIJ9vACiVu7trOHPEB+YZntTSwNudJnttNJNiDYVdGmKR10cvz0Ryw
	 Y1E1LmGM/f4sEzvo3pzKPrmcK5NGDXW2HP9RsnaJQZ0SZRX7hpe3llzuP/wylXhT7D+8F
	 ThLAezF4RADfe4WGh554TyGM+jYPG4keXXaLfEqM5j+2ooRWNjtUHWtwPpYM/Sg8EAmaf
	 2s50ne1z2CFDuv63V231WesSj0cXlRfIzs20tfahZqr7QKvvPdYjTlaqfRrEukTZwmJ2Y
	 2xEej61UbG7u0OrduH3P3emj69uaqYjXb06lSSMT0txtUusEx2fZXeZ20oQV4b0buJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDBA606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDBA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvBN4059968
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=; b=KtnQKBgrryNKBV+K
	X14+Jy8gx3M3wi0BzySspud7Y7foqX/OEzl1X/cQccu+jSSLNyiwPc3lut2qiH79
	UuCf5pp6ZQ2FpMbZtMYGOIYxHzbAbY3g8AXIgQ4kOpeH2INHnwMgnabjw/KOv0Ph
	JrILVHRbu8D9R9c0dmrksBf9lASahSU3ShW9EtDAq2GI0nzvteKfSYSDg0/A0/VX
	u0f1d51bFgyIb+3ANe0rF9ax+WkUSJ45LZ0YISqX7aZoDDAmQvgQbGVS0AddcQv5
	+zKWf0QcSN8OpUXar9hJMHap2Rr7aRB9P09cSkEI1O4toDuDr2buWovgkrQzyOUp
	G6F3ww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchg16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddf34086c8so411284a12.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981780; x=1795586580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=cqSaMUA9uL5CmhqrYBxt7AAQIG9rNzJ9MjcR7IwtnhnA3iZ1WUKruQVu+gQNJqoioK
         drmMwCGq6j0+bCt9OYb80NNi/6SGfUPsDP2fFgWh1dejluep9CoMhqspLtbEtdpYw0kF
         l3Q12u3fDmUqsZ7W4ar0tY1rihMyDzdcvX8+ez4lsgDBYpjxJSNrIyVcbzbEI5xyobUL
         2bmIDt06gudh+HCKne0QgJymDIo+QJ/LkyITJDnIUAx1Tbnfx1/APQJquTgYUKZd+YR3
         lnt2V6+o5oIN1qhi0jdUNBHnW8dQ0wdP6HE4e4Cp3EoFvvZN6ldx1thKDDVNSu2KUq0p
         nC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981780; x=1795586580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=lm7Q9IBc9Yca0+4AqcdAs6ycVDG8XB8RHL7ozzRgCyTQ5O/8SLIelDN/DIBNvn5ce+
         P6sbobMV4NEsjXup4MPeNXSj6RpWFwEYCYrmpTR+lVZpwLioMgCTPW+bdyTlYCBSwtRo
         HJBRkpo6VS9fQhrJ62f5DQhbltJtmtrb3VOUAzOofGTrKVZBmjMAinuvfp5BnKsruouf
         ZFDS2qBCVyESlqfwlBq+UqHad+upyEL/KnxIiNQwRyU8HCh/ITvhPgtZqRBru/0hRJbf
         DA1opsphBLkHa8xUcXq/TvgtCnPxc1AWF22xpfZitM4bcko5e/B5QYPUYN/ULF3siFWm
         95iw==
X-Forwarded-Encrypted: i=1; AL+hErEtnsJRWnMVYODo8vRxlYrOm3XMmDJ1nvQGW5ztvsZ6SUJXSYbMAHILAsa2bi43OW44207FfVskvtNT@vger.kernel.org
X-Gm-Message-State: APuU4Z/2WuwbrIS6LhY3BsfeDBZ/taCMz8N9kWU6LRYvwW48oc0E/Gnv
	FJ3ACoOapoT9vt/okqIGuQpsJ9ixa0BwXzBL0fyyqsAHKmv001Cjd9WlMW/UpIgDDshUPF/7uWG
	UA5JliU+fqUGap4IdaCwY7qC8W9qfDakXBb37p6kbHq1ijUG6077kVXrK8PeEMmua
X-Gm-Gg: AZFdTZdHB33KGURxKxe1zrkkJTisbbQ30etoPDoQpRiUEiwoD+yMRCwY+c7VVyDSP3K
	Yg/63kDFQqQbWud16844jIHOMu3sVGNjeKuDFfsmLI5Q70FdCth8/sTQLKue4l/ojTf6yM4g22N
	oqv7Cw1Fh32nf2fHoRECjuETo2AcHOxgZ8w5nVN73Ym+Sj4C4i028IWLzPNv4l/nq1XvWuGGsx7
	GEUsX3PjYRJtiJ1v6X1a+NlgRUx3ccoNPAb6jGYgtR2KCzI44pBKZucc7T1qY6U8wGMEiGgWB0c
	QlqnIHx3copIT25+UCZIAy7K1qqnYp+6BWYqC+A8vAUgwUZA2V4c+ymtMNgNjVcGzXIRPCBV5T2
	mY3NGDpeYFq16nen6mUJbbMCuPPF+tiDi52FULX/yrCf3eRl7wInAMYUs1oFNCkPvfhwca1W1mw
	==
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780775ad.39.1794981780155;
        Tue, 17 Nov 2026 22:03:00 -0800 (PST)
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780565ad.39.1794981779689;
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:34 +0530
Subject: [PATCH 03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd3f95 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 0H1YOBx0Qedb9mZPYMouTCJp5EXP00Sx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX8KUV5YOnlnMw
 TjmO22UHHCSmxgejCGQjU7A9T5Enhlz3+KE4HqgQk3d0F5hT4Kd0gatrbf9SDOddHwocHHqGpBA
 K/qdDzkjxUPUvvCKEA5JM2e4mBpZuXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX75mfgjdWFABQ
 i0ATOhamMMDpktf7BwYv50QcQjlL8+80PZGI44fSKnAy/hB18NrB82Q8c1Im5jM9NW/iINIa2tC
 idYtqr/lJNe62tRTJXEJZ++Xm0yOHtA5fBqiQJECqalp6HpuoJ8Gnxsy1LvvzEe1wtt+Z1t/oyc
 fE2PLlM/cSvA8UMPqo1d/G3qkzSbznppQcRqBl8KyWO0ivHetUglDLRqNbkTkabeIjyVFPO9p8O
 47Kb60+x3w5H/s5D9gJVJL0NNlEDWIjSDhqn9EiLcatdwXuHmpl2fYMn/xVh034w4NViUuprWPU
 Bf3jGZ751xqy9T7CD+4tG/y5ds2XWeXM9+sUPU1pqVzgXmqNXzjKxEqIRnbcUu1NLSxtN1ZPNmw
 uOT0Tj+DVV6rsrYt5+ZqrDz1knmJFLqsJbWVFtBy6+YPbzZam04gES0wczj9VBGwcGpEEWEzpyf
 J5QfqT0UA3U2igO/PHw==
X-Proofpoint-ORIG-GUID: 0H1YOBx0Qedb9mZPYMouTCJp5EXP00Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SA8775P TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 7a156b9bfaf32909125efc89e27f8dc671909964..1100ddab52290093af87250e4181043e924497a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -83,7 +83,8 @@ $defs:
                 emac0_mdc, emac0_mdio, emac0_ptp_aux, emac0_ptp_pps, emac1_mcg0,
                 emac1_mcg1, emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio,
                 emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c,
+                gcc_gp4, gcc_gp5, gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s,
+                ibi_i3c,
                 jitter_bist, mdp0_vsync0, mdp0_vsync1, mdp0_vsync2, mdp0_vsync3,
                 mdp0_vsync4, mdp0_vsync5, mdp0_vsync6, mdp0_vsync7, mdp0_vsync8,
                 mdp1_vsync0, mdp1_vsync1, mdp1_vsync2, mdp1_vsync3, mdp1_vsync4,

-- 
2.34.1

