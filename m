Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981851;
	b=fg/0EjpOsJ1RTSP8RmlqEYltG9y5DsJ7eAuzPD4oACEiSJGryj7psBKA5xQI05wfq+WZ
	 fuZcDiZxieCD7ipny7vkw6tEZm6Ql6YlVFVC4p2rOMWSBJLQ8pWBq0dgz0lG+xqMCFS4y
	 PlCMSpuL/K8tqdPfphEqKHo64xf5b95MKGuywPtGi66o3MkZ3ZjA7XBZUm2tBtmedNJpK
	 K70e8LAugTVj+ToIROV68irhsgSlBr2HdvN83jjOleooxF8QQ9z5Viv8ft2sajJM9777M
	 QFyNx0BOfz+Qg7wisHwhOiiTjZ93vMtDD9tbU7zf4HpkKulhoocVkEP0qablTeB/WYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
	b=snGVKXZOKbFoovmVOgRgEm5hPXCU2W4lzqlK5jI/9z8Ej0BTVMshbotb6uKcvQmdIIzG
	 tKvw/2ffV4CbHbyL3jWX9pTpsdnVsj8QHf/b8PPD23rds0nQwlxb2xIxcNxJcB/TaqgNm
	 7X9rQYMNF/7Tv44eogM3WAyJHooUBFAMmZ3MP6t3aJ0CfsLIk+ZeJtgK9o6+P8ocM2Gxe
	 guJ1jX8l8HoVZ42s7UV6e9oqO0r6QUvNsh6fHrJEdN7FIai4rJp0bXaxNDGY7Xc0PWyxa
	 qnzZhaQV9+rodv0dotdSSEMVeYpJDHxEQ37B+lvMtF0enE8JNl32HV3pm1NW6qpBLnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1E606A338
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E1E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VfpB2107748
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=; b=eV2sutkWNhNbZsQ5
	PoSXyR6mwybyCNybowgcnSafH3YUSmf2l9K/Y17xXAmAtw2PUc35h2fQAAOZuv7f
	8CRgkASe5yArEZgdy7CUuDj4miGuZJW4uAcszLAh2F74RvKw6IRjlV4abAvaFrwH
	GNaScSI0ZSNk9KBTxiJ339YiHe+ktxFUDoVTuYQZUNeZ1H+GMYztJDHozm8Cr7CL
	lvi7mTeEzG6zxnW4XoqOho8za+YkJjPqAqx6ctA9e15NRwNXdK+xNlyCXP7qkJXB
	us1KoGDTtZ+EQwoh1P05QfTDkCpYedDdpxs6INXjxHguynugZorKDwdarHwEAJYP
	o/kzPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8seby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so9684475ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981848; x=1795586648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=Ku61ZCG2UTBxOjwbSUebyqAV1CxJtr/RTitusCptQNItM0eB4FhHmeyrG2piDO+qMF
         TivF6bW5GmMAccU7GV8mc6PbXq5H9O16+dX0sSanuruvfIsZZPyoiJJi7L4qnxSsfgi2
         27OeeI9aRhDw8efaFFh+sawuET5WK7R3dENj+XGUXrh4t8qDohAPJ3EPoclplFdJlFvi
         L3hTBFm09v7iu8FKT60uTYlheDZkoMRWvvnlFVs+YLnN7ef/JCBMFXH0kF10kRS6/y23
         eHQtxm4rwCuzEgnm6VTvSGzzZpR45HHCINxD7JsN5YF7Bzv49azsH4yCR/ProrAM3uCI
         sz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981848; x=1795586648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=C+q+EhWLuwrLh88V2QvPmLRX/9afeR5c0fuQruWZl+oVARrGJJEjH/aCh2SPWDU5nA
         AsF/gDuJZjXpreacpmGriYbI6G8hUPmPdp4RIPqZt59/ddJ6Bi+Rutb1/sEosirNqIMZ
         zOqM7Bry9pKaXpffMpDzAgh5ys79++PUn6VIx5Pz46jz2JwecpmisvazeFxkepSCNiKF
         CqW1Wk1P0xMPVcJlyYFEyPq/u8sqGNwFEU8r5vhsQ4TaSqxPmjrYie7LaraMZAzMob/f
         EeGyOyAGZ/JU/MBXTk27ZOsDBQRP19Fmth4Qk+8Prky+zCVhPbvl2nOVtLR2c2orBtyb
         KmOQ==
X-Forwarded-Encrypted: i=1; AL+hErEn5I8qetQi7FVMmYFx1+aGey31ti9qH8L1utQcp0z/Kf/XFnKYU1z45+eF7DOrAXpfxHZpOxUEYdPC@vger.kernel.org
X-Gm-Message-State: APuU4Z/fdvIwnq98O2t0s1LRL/Ykz+JQfUeFpjJF+sQOncLoXEJ0xSNj
	YZamjsQJTYWLkDYaYY5n70C9D+i6+c9M7jwAz+vyLpKsKnbBwOARmP80KU53SQFTa6HHs4hMLVn
	Em19QGZwMmWFzXqhGA7BjYZ4FByaAs99phDl8lUMNg8y9zwOKqVRpdMx4pmROCzLA
X-Gm-Gg: AZFdTZd9xLtWugFMV1JfrsDqES2O28iJ5gnhxKT+DTGJ2XpQ8+R37VYaaqqAZNzYjVl
	fbGgcTc/juO7J3db0w01ET2q16fOViwM15chLbZvDxyFRtx6SBI+4PNOgkZcyYz8RS0/s+vJdBY
	1bAOjI7mcZ2kxCVzuSMA/fg1kQx8LmYENQVHvdB5RGAzHX9XUfpdB7vdT1zRpM9MaINJtGUdHsw
	UpePpjK/udHM7eWNX4ljGxsl8kpmC9tTmoTXC3KKBe4vV4/4RTZBaI5cAVd8rlOiOY2D/IHi2EM
	3FyzDA5KhvW+Wq8eKybzJYQS4YsiZmnhuNZD1SR1/XUyMDH9wBWoRFzCvuaIpT+L67jAYwHTFt0
	PTtkduOPF6bvg8PkVi3c5g6djr8DyoydA47mdxoV8Q8zu24ZmFsUStmgh1e2Db5CZkdxaMvLzKw
	==
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316745ad.57.1794981848155;
        Tue, 17 Nov 2026 22:04:08 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316465ad.57.1794981847679;
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:45 +0530
Subject: [PATCH 14/18] pinctrl: qcom: glymur: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-14-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2-UUUycNonjAMMEjqpHfuPXpGWuol6nV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXyw3Q40ECVZ0S
 FszS6d6kVyWASKaH+/LFvvJfl3sm/7nWrZS7RCYRNjDWn45ksL3lIbXXqVjc4NUhFXXE+UVjlrT
 5BIlgrqEKpdmgfB3ZswAf1dalIV+sJI=
X-Proofpoint-GUID: 2-UUUycNonjAMMEjqpHfuPXpGWuol6nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX6DgslmdwuGbF
 Ueh91DnGDB7dVMj6r9GzhzhU+6eBFQezQ+ZrJckcsQqoV5Hg0qV2ZxK5HaZuF95dPzAfiJcdzA/
 sEGzpFTasjmNScdsYRhftc0FerreUJh/fg5NC8ASjyRmfKtWPwwukt2qpHyI1KbEO1hcpbGCBj+
 TIBr2K0L/KzmrnmleYyCN8rwZudgnku9g9Nt8mm+CAVd+eymwep4+kQfdyTY2XnN0YQkji58lop
 iy3yiiwnMbA+aoux2p6kpHXM5HzCOBzjGRYvOUhSX8vfXd2RYJRsC4op9dMHhnwFtFOlZftbxBH
 z2+q9Z/kB34e6/I6iqpi+wjo7ONyLy3k6GHgbyj+B0m0CJyW8HbZvwT7mVhgCvj5f6gG/ivg23A
 L/ljIUv/n9nMwX/K20n0Ij/gtfULV+Yon1BOCBWm3+4LSMKLUrcLXkPzlOLGtJaNJ7fFKfCIjqF
 LSG7OpbnQBKQTyV43fw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fd9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Glymur. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 20f076e59375628102324cb791dd7b269dc10fa1..38cef09659965485b3fe8827b91b561ea8c9a2ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -645,6 +645,7 @@ enum glymur_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_host2wlan_sol,
 	msm_mux_i2c0_s_scl,
 	msm_mux_i2c0_s_sda,
@@ -931,6 +932,10 @@ static const char *const gcc_gp3_groups[] = {
 	"gpio82",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const host2wlan_sol_groups[] = {
 	"gpio118",
 };
@@ -1344,6 +1349,7 @@ static const struct pinfunction glymur_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(i2c0_s_scl),
 	MSM_PIN_FUNCTION(i2c0_s_sda),
@@ -1494,7 +1500,7 @@ static const struct msm_pingroup glymur_groups[] = {
 			ddr_pxi, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qup1_se7, jitter_bist, atest_usb, ddr_pxi, _, _, _,
 			_, _, _),
-	[53] = PINGROUP(53, qup1_se5, qup1_se7, _, atest_usb, ddr_pxi, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qup1_se7, gp_mn, atest_usb, ddr_pxi, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qup1_se7, ddr_bist_start, atest_usb, ddr_pxi, _, _,
 			_, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qup1_se7, ddr_bist_stop, atest_usb, ddr_pxi, _, _,

-- 
2.34.1

