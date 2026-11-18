Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981837;
	b=BiwL1RbPnAog0wVi0vcNfEQeyv/lsQ/TVZEdwbON5aC24odtROfqWGg1fe6Oo4OKUp88
	 I50caW8VK2iEegJdiK2Ui2uatb8lp41CvL+kpSdqt5J34vfjNgicovJDTTDxkMHemDtY8
	 PN/VFzTlR3dYbwGk1MpEmFm7ejN1QfmB5Kb1aQYaYOxmqs1eO07qcxhjazZHCWQy/m3Am
	 oprZsEE5OcDM7pT+TW5wO6TfWBJdgi535+93bPN15EASDbYtF43AQjTR7s8zLkUF76pv+
	 frH7qTZB7mvDCWveLYp4c+HKnF1j4AihceW6nvL90DP4h9O2TRjSUJlNlaonnTf53+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
	b=xsV72wqf7ZnOROStuOT5olWDRX1m8BIXP0yragHjMLTBnLSVlkacx7MjFD5jxmb0eQih
	 hroxHtBT/aVACLGa4dyHw3jwj60ZYCQDCsG8Gg1lcMpYVJbqwv+/GvO8i3WFidX863QEv
	 FxyxLD3O5uuSY6/31tG276ybWnisAjVoE5ikwQ45+XJV8OH/Lv0ge9ADSCWjc6TkhaRUR
	 /1LOnEON0sKGSVZUXocdTzwUSsDLWFYIVqKfezVGXpG8ZUpYQ6SwBIrXAObAOCznpY5ow
	 0QfzYtZpN9I6lMZdNrVQo/SEwqRow8eZviVYwtjihGUjKD5joBUDH+3jjTrICmLgVxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46443606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46443606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwhQ2602449
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=; b=WJmtjKPM+Gt06NeY
	NK7I4LsMjwV/jDaDyAhLIdsLORSo/rqYaQiWaSpWB1twDhUQU7Q7LoqUnhuJvt6T
	gTR94IzfM4MkFCmoqopU6DRc4hgRbrPqWEmweAg7Gy1FKuF0zNlmE8GK0nODLdlx
	nuZUvE7A0Efgf7GVTsuSfdDwix92zi6fjBC08pxTpZ818C7ilLL/v6bbIVLPJpE6
	hPbDy3tIHc7p8PycgCpsX7ATS6VHVM42Fj18LPPS3ln1M9zCR22qeySm+TYFCgI8
	whC8OLWaUGz7iN6epytNG4S18wzeCdDzv42umwUspnl+wocUtOXfxEVHy119jNNK
	JE6yfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so8981685ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981836; x=1795586636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=QVYrrSCaPKymmKhsag1F7lcVJDX4nu5h6tSbiitjTfL93GhD/9gkWb4dh844lxz4lU
         ZOJ+EktTuJxn6p3rLj5eS5RnitlxVm+V2FdEDvPmUhlbSk1ks6XLRQ7hqAWYkfiyeVGb
         n6CyE9b20SE6643AI9V/k0PffFSFo6YnUDqKoR8DGk+XaBZn8siTEJRzLjTWvKo6tQZ5
         OzGWaGKXqrZT27EoH4NH68lfSoqkUw+BvdC5195FNugQxTiawn5f90t91qWIePCZ48I/
         TKx9E633YnAGTzFHF2nYWRxmQ9lvFPDTX36mpsiat9qZWH2wUaFfVVIY3OKtI+U7hpUf
         9kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981836; x=1795586636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=QMzM3KdANCXCMkfc4MmX296kfGm6kRne9ofFAvetvHLKecf5hMIvR3qeBeIz/RYDXm
         X9L5QiqxRIx9sIMOc70BAPXVBYnu0VjEZ7UWg9+3v8PlqCu7LpDjSxsYwcSLtLHJt3Fm
         kCTeJYITaJTJWIztxv+fjONCDty4DF+30ZUQUih1YaU4buRHNPptPQ6u9+AqHrQOk3ve
         vvQwPpo84xxdjk+cQ8mtpuUq0CczE4/W9vxAAee7BcRqROv2ojz3FR998Q79LPRAeysS
         ACI2HHT9uTlfxkM3No+x95TobcCAkrJwCUkSDqpX7sVx5awtnK0MDpZLOO63EGK+MgCu
         Q/Mg==
X-Forwarded-Encrypted: i=1; AL+hErEboIz/1OzRxOShGbEMsq01rB3Yr9F3nm2HbZ8kJIwtoGbXG6yM/+M9gWvbabNBpeEzGor0S/cFgcIZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8duKpgRWWTvpUqc/+ts2lHWNm8QoNb/osaMz6Cak3nR4KIxz0K
	CgJ7BCcOo37wvFcEOs1sgfHpbDWrxlbLxKe1xdgw1HPWewHS+9WpZRmiiAY3tXfoyyIpxjHYZHH
	myykLx2qFmmerg120JLYQpPWVVtWfL4lbBRrACW/Kjl7eAE0hifE0QLMiuwxwvHrW
X-Gm-Gg: AZFdTZcWcbosJTU2aL9/kPZ0rOFMMv112oU6q0kAPPpw6UqicxsHWbDTUO32kFdEx0D
	r/JxkddP2U/i8TcaAYIdmlTQxqGdJKNqZYur08mKWOCkcuyuf1TJYi2Ri+G42IZ1JgjyrY0UU+p
	Anosinbz4pyOeqODB+KpqrJysF9ctqJgfdJw1WT9VaVoGAhIwGVOhNcnzbXyI/0ieGDZndw3kbZ
	9AurucO0Q1UqRlNkhTZuz1PX+WQA3xDSVtSy0raIRBHZRaFN5eRyJ/DGMzdZVFVrFZCPAdSxZUZ
	xG3fw5DhRrSVvuksb7gUWcqgi+IImZfBblI0hMPUMnE5r3yQZ8H3hcFmYkmQNPI60/BMF7JWj/i
	ndMmBe/VgQm2t73aBvNZtq2HtNhXli7SJrWyjaLd0n/qMnVSFF4DTpC0tQKSrI9RUQjUleTnfgA
	==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345595ad.27.1794981835880;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345315ad.27.1794981835507;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:43 +0530
Subject: [PATCH 12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-12-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: YWp4C6Xen0JETLHpClWH2WQURiC95405
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXxNNpWFmPxz+s
 50gM+rePQHY1VHZpLYFf7LTb8Ua1BhUaAGB+ptGFru9yQZKevWQA43vyaDAW9Qg2rbnmNTYpGUd
 oj2iZT4GeOj2jnD5YxeS1yolIZLgPvgUsUHeqiTe4cmjuNMc8cQ0iFwe6T+/iBKqkoPD7Fet2DC
 eXdLsV54nBO+inX7jLo4nyAC8+beQ7x763pk40uwHXnyCgC3/Ei2X6JUdqaqEqh9oXLDbGdzR4/
 nY/kne30Im9AEfHo/C8HlAxT0mzoCd7WEupwOT2bFr7dft+ZjYy/900w82bL29MSChNrnwqj0zX
 Mo4diTZN8/p7hezoWr1aH5yvBKuPJ9Z6KL4T0GTWRwPTziWR4zIlNjzfVio37ki6eGVf4vrACOF
 Pa7ju1X+tW0i6o/8W/L7Wuvr7Vipr4iTlUMH+/sZwDFBQ5K2sNtqgoOs7kCBmWgZOK1LdykZwEH
 Og+YKDK0dE2Hiqc9/FQ==
X-Proofpoint-ORIG-GUID: YWp4C6Xen0JETLHpClWH2WQURiC95405
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fcc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4rR+poJDnU0I
 eZMmMLhFINZ4J9cs84AWpO9o6IeEGVu27SY2pn89FpDB7BsiXsdRoG/V0ZSOeP0GyGlHe1mN1Th
 cUzNozPX+HTdChQbMY0T53h2w99dKI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Kaanapali. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..2c27eb2255c30777310e6280f6767b426b12fc79 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -588,6 +588,7 @@ enum kaanapali_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -890,6 +891,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio42", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio66", "gpio67",
 };
@@ -1380,6 +1385,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1555,7 +1561,7 @@ static const struct msm_pingroup kaanapali_groups[] = {
 	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[52] = PINGROUP(52, qup1_se5, ddr_pxi2, _, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, _, ddr_pxi3, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, gp_mn, ddr_pxi3, _, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, uim1_data, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, uim1_reset, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

