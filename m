Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662648;
	b=gVvDphzS7xEVEd2FTwrNH6HOOKjCLCAFkRdUVGW75pnAtxSnjRCROI3KN9gyFlHNeNck
	 W4S0nasxnC+ZVZCnIDBSwTjRI7MrvNvcBjwEKgCgpqIgYkN2pIxr1RHX9HLzNXTev1JvF
	 j3kOLKCJhqptGVeMPq8GXxJrV5p9RJ5ydIleEK3ZcfM4XdrhEESk3bG9xAGuAO45zKiYH
	 nE3R/AOPPf/dzrLSlmFRx1DddDPHaxtltP1f8EQjc2Jxi4s8q47cEa4IHoTHDMEV8UMMA
	 EpvcM+Qm2FKPLnX3FdIvAz6VTtJMPlmFeRIVGu+4fkJlnMG6C0A4orinWNikDtmUeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
	b=RZ4SuHikDPpSMczE4OFwTGUZdiUVfpdbfedWGHcGZ2ZkCMXP00viDyYmvc51242rjL+z
	 z6YnlJxKFDnzy+XW0IW12PSHAzzEZrK2MiBwuDN0dhYNMAVQgiVUjHHDoQNVWrGN+Qqlo
	 NkaGCdrN2HaG85sU68+2xA7mO1OfTDG6A/U4pJ3ZkiRB/igWwMlRDWtGnFgmBbWu8DoCQ
	 aZhlpx/c1LUTZQvbev2wiBVvggBeYmL8R3mPF3OSjMegLXbnQPpIMbNzRQII+RHdSk87l
	 qwSTTscTuG+uToEgYSnTUfmvlLNZSHrv9JOpWE2KZWJrrenBAtTRgqeuH4xOXaDKLgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2A606A32A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A2A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xvDW1560116
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=; b=HTT41qshpAamlNKp
	XkhAwr/7w2gIL+xH6mvR0Lv3CPG9e8dadkJfJTj69HK1GTHzuNPyxu2xUoWlSSfZ
	Aer1ZhsCH7GsK0iQ5FDa9iZhjVIgBjmz925qrTZOKREBiPrdw9O/ZPLd0Zv3uyG8
	eB5+lrJ9VepwQPapibS4LvoJjVHpy0P+Up3mPrkd4mkw3STfJlv8XNDt5z88qqdV
	nzeJ8Q7KSnYkrQl3Emuulhb4scTyy6wXMy+dfeycRqtP3vF1Wi2njdLwaSd9Z9pA
	O8ta8o+UcUQE3ZYsrr1QGUqcZvVjc4vkRnjYntl79M2cCgKQgJNolB5QWJy58JW7
	3WfCaQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahtjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3155719eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662647; x=1793267447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=eJLjJ6AOJ3RsfD9yXaFtoGeM6rF/piiquIb0Ci+GWDhOvgEl7TPdeiv11nntKOGyPY
         ttHTqtaP1MQvDnj+DZmMIvepqnaU7g69uh14OLdfCcg6xIQI18TvY4tKDseaVVe7KIsV
         ndbGUSCVgSfoAsDX2VITJRjowGsr4Dg0vNd1asnMcPMmOGQIa6vukH0RiuoYVOf4Ti6H
         JY5EFdznd9a4DWTp2h+hfs3QjQk+ZssTLJYhf4UcQdKqQ8IrDM1RIPkh0PKWC8x83H+3
         C0Qjabb+iULh8nxiEer70/m6E+9W5k0m2Mrfa4wmigwXiEIGuGRpu48hzUK0uS84O8YR
         AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662647; x=1793267447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=uUbQCFPW6kMsEmpM0y+X2bTIDwu4wJeBfUyE4KW2eMwtarcCCfefvA8krIelgI8ZsS
         6MNguMHhHP9jLv2kY+zp/jHs6okvvFyl1O9hQbSQ9qHFADKnHnuwGNjhZZZzPwDZ3b3I
         QEU4oItpMkEYx6CJ4K7UCoYkYbF3H9wpSTtPeIkHzDmDi5H+phDnoDNM8TvwpBNpIId3
         eVzTfESZ+vqvzas7yfUtsSQ8rpp3HyTH5hT9WojCsyk+wBZS/FqLj9IMwl2EPVo3Zh6e
         O79tTkdturrBqZyRs1qP/8sgX03eSOG5misHEy3pZauj7a6xjt+xvMKYb1ikRVUu3Mlv
         1DYg==
X-Forwarded-Encrypted: i=1; AKwUvBxqcZGYcFITl//n+nEtDgpF7nWNoVd8UbUyTYv0NziTUXgv7Ss+juiydERoeT3BfBLDzkfODSCrYNR9@vger.kernel.org
X-Gm-Message-State: AFq9FYKbIvw9M1DWTytY0PtD3RT81T2lnAV7F5rC7v8MoydxMzbvKv16
	mbEWgDD1ynx1A7KSn1YW2kmso0D0RAQwYpfuJgLdh/OZLpHga9Xi1gu6//+j9YVI2FNsE6QIEHs
	i/x7OgkHrxs1czuqn0C/gYoaReMP7XESFU6gmfz1hkuqYei1SoraFlAlCh++0soBL
X-Gm-Gg: AYBFou1b0Yq2kh9Jz5eRT94jhkZLKcSuB0RjUA/JmcawNqGvOxhMyI+bwcjf21wq2xC
	mc78iaEWCwbZdgXn3qAxd8gNgsM1yR/M5XjEw2gAOep6VW0g6Ooh1XGbbaj6KXrwueNyNVL6s+B
	cRx/iPdX2EMwT2iSl8Sk6xnnfa3fYGT0qKmATEYwJumnfz78CrC0hLMCCFWwjjkCxgT2l/Z5fXB
	oTYCICa+ZNKTb7B4UEj0nlYVvoKvvsel+AoHXkWtGTuOD/PvtOL9YaRI/mSYrYDmsW92ySSE1fj
	zP1BDMEk//NRACiq926FTJ8QYetGEwwv8GFFlbYsW0/uYmgXpW1xDdO+xczqxUFPYfVZ7BsCXUw
	00Iq6q6fxL7w7sV5uJU2rwQ6zXzrUh7WpfkM=
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099362eec.39.1792662646457;
        Thu, 22 Oct 2026 02:50:46 -0700 (PDT)
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099342eec.39.1792662645949;
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:46 +0530
Subject: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
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
Message-Id: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=751;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Tc936ZVNQW6mLGok/m6D1h1BrwXL3txIdA0BfJ6MmDE=;
 b=1GX4UVZNZHB9/gF9/n5KSTlC09POzm0NxrliBtqGTowzVdhcXY/VFZU0aheyhoGUqqeHZyzda
 a+/S5i3EghQBBHopSjP5F3CPKPw0q1SJq0X34AvkUNV9NbMsgxJSAyn
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX97gU/1mR4PcR
 o4i0PPkk4sk+sRMfQ0tE6D7yxDFArseYLk1chHp7+IyvMoYRgVnI1sDGBuoeIws5LHH1uid7s70
 1STyVBxD74izxrBObDuQZnaOH7ALs6aEIvwkg/skeV9SLKesL5zs4JSuJESI7yk+fEFO636H1St
 PJWp0h50uW9qj2djRLCPgU8LGTt+7osZprGVtLTGFUmFwdEkbC4oaIVFFVCFBPleAlwlKHjQPu3
 90Z378EHHWYgPFbxdJs9pop8bnq4rPidEfaTtaUoyRs4OWnvppJGL5cLOlfmz7TnsI0gXGjqp6h
 z4hDWP01JHGI5Z5GQCI9/bx8e3EOSHCgjBHHct4fw8phorsQhe+datS4a1FjsTO8JqLxkZer4R/
 HajHjT/QqQpjRWjPtkolR337Kou8VIhHB608jE8cc2xORiBWGDQkw/e91QV0j2bm57e3mb0rRhK
 umfFM5pAZ/hxJNTrarg==
X-Proofpoint-GUID: XlqbgdK-OSDN67vejNo2QN2raANB8V1A
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9dc77 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: XlqbgdK-OSDN67vejNo2QN2raANB8V1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX+oC5S+KCBYpY
 iVhQZBSOWlMvuHaIX/3+tNDfboABngQdewSyKvi49y/acKRDPVS3MPVqPShyeqRWdkRKARZV/8d
 xcc+OmOyQIqjiudFD7/nFQXmpKB4wDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 22eeacd7aecd..bcfd9e942eaa 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,6 +976,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l1d_1p2>;
 	status = "okay";

-- 
2.34.1

