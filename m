Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548050;
	b=noQabqD92n8mt9Jcj7mAGdvi9+lm3UZ4J6fc8qAto+6l7eN2HYDqzYOK2gYG93y+vadW
	 txFpKjEM8qN9ZYfoxiTe8NXj3JFj/3N5C1PWUcqq4SqVUn9TNUeEwT4Mz0wW6euC1XPf5
	 fFTpWm1LoJMBbOc5ULJWiKbEMqvyoKEsJpWWnr6LHusev3psdu5u8x+TLjOuOQBlPiZJM
	 hQJ+41bfVUTlkrch6IIvhjQtBYcvK35DCZMMUtUbx7oUonKJgoX+jZDZtdF//hCaFJ5Co
	 yjX0DWKfcekoHArlsrwa1JhbMAcPSrWsDZbyIhlbO9MyZobpnZqRPqY678Mj9JPxFjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
	b=PtG8EtiZos8BAxExyQqBVr0HzAkfkZZ6tlE+gdpTOhMVww80B71E6vhUSVi7Uxq8priu
	 gewaVAteg7/WfOYxJAKCAG+tHPj/2FgkEtXtBMdsK4gecur0ybm3nkKkOFxo2CgvSzoCb
	 rB77qyqk9/re3avQvleWr6CQu3EpmKx1WtIdp4/gGF84Oe9OOmlVdWpHPQpS3baJgfrXN
	 NYkuaApRg0fHLoHs2dTMONLwapJpQRbJjsqE7Xj1uB+g75tb+sq2yiaRxDln2RrMqs4WF
	 UCCapl2VjWK3mTBCBRjSyFsi/dz4xL3qfNXwX5xPAkk4gkCxMHGDzyh6XQqqY0K0YgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0D60A5BC2
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE0D60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57N971631608
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=; b=btfDw3JW2Ox7IA8Z
	si602r26ZUVvjQPYIU1tKK1w343yNFumbcLZQs++bascEp/ldrfT9/RIV+KQppnZ
	54wGzfq2Lr7xwUMXYMow0toYZdEa4QSUZZcdl8pMXxI7BfgqgfUeG0rjYvF0IQ+l
	RoHZUx5G57q1wGTuggyIchGUw2Vopg4RZ4kD7Xgo7Yb425JamLduxq2W+jjzy7Sh
	xp0UC7xMC/W1qYwIJxZYNSjfMvFge4BRGxW+j0SuLdCbI+f2MPHjPqxoyuFI7CGf
	VLE8EyBlUkX2eaPwrkHf0A1Y9odyGs20yz7B2xEv3C2CrM1Z8/HBIqM5OdyuQZ9f
	/H6/ng==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c8gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4ab90cdf747so2236576fac.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548047; x=1795152847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=IQ10AOerh5tIj0Ep81h7QKiNRTgWKy1v6hIwNKDAixhVSTYEmPrL8HpscEefMP53/U
         nqIW2n78/yKi1ItBzgnoeEX7X4b+xCoiCqHaJmh4KC4XAdEO40pfrz0nwFFMnBt7Gkba
         tvkk9lBmVzEt30Crl3NxBX4AhtWX0q1rOC0R9jeryL3eRMGcbxX1cM/gxqsPOjc+TZHQ
         dGGNos/A0pRti8vqrL0CAtW0xXljmVXJm/UIpX+yMMNIItUV7RVpIuzUiPaQftnDvhnd
         m+sBXGDiZzWcrVtc8MpyfJ26f4sPbulisASgA1yhLetPxdaMdO6JTZUHwbCEJ1HqpKom
         DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548047; x=1795152847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=L3YcMoedG79FGOSjAJW8CN5df3dYnTEovO7C1zJp+odOEo9V/0IID45Qej61HqjshB
         QxW+a99pX9IZGG5tg4GUfZib8ZKX2vgVyvMYmyiZ+T8BjcN++JFmKSReqhMPac+qvtJq
         c4jHxJEpvPM/Wj71vejt6xtb+kpSMYDriBijVKlFGehJ0bB9oRJzXuEZ5JhNQlOXUqPw
         9GHBw3G/sSIhNFecR121mGFNhdvzjCpc1yEhl/guzRzDUHyIQAw3XReNWQdnwSV2Hari
         RT8z+1t1/c0P54HKcfrp8aIOZ0pzCl7fO8WnGLIqyK3bvQ88TMxzjCXDe1bYaXgKJCSa
         pLjw==
X-Forwarded-Encrypted: i=1; AL+hErHrRC/cfuYhSBxKEfJ203Bn/8psH6e4KDdpDUgwbncklSnPOkrrvtzi7fUXluIjnlevCBDyaT3SKmUc@vger.kernel.org
X-Gm-Message-State: APuU4Z+E/Xpvw27SvSAXI+GkHA8Y0gWZICDUAX7Fr4yOByEJ/qhXaEFq
	ynbQ7aLUil1whevZno9ro3IRdqbMyLfde6y4q5YGr3oAFNGGumUOBWgtPSvWaKmNRI7BPXo4kh3
	g+b8dHhS8lwEpUtQ443U3JlaKrSvmC0ewv1wo4HRw1ZgNNGMx8vNDLt+kXIwCq9lT
X-Gm-Gg: AYBFou3aJl7rO3cnck/HycO4B+4oM0yWpuZJRfpYtS7iiMfeVOjJ1vWpnmMo3m5qGPR
	U8fyTF5et7dEtop/VCTI5LUHQR/3PsY3yloOpHC9qJDCdYF2UGlKM2b3hksqP/ro4D6+EfQpRFm
	rVly4jZp0HgRxfjanNVHdwgjmAy7HA/telR1q3HByDsfP031PmIXomql/tswTxfwipP8KSbeox7
	Ac2P20XDLgRrqdexjbbXt1pElUTKfrlkSB3XOfHRKB1y0A9qzUOwJwl6ahePl3rQ7Z31A945jBH
	8yKorUbiw9IcRKXVjTjhUXNy/0880zb2g0ztUOiZus8Zeg0Fed9FpSRiOSilse+qt66XpdSp20d
	7p1aYgRsM+ls6hUetb2/4Qza43qORqQCOknSlhWjqZq4UmxIiJ/CGt7mu+jxIOZLee17Otroi06
	zfk1DUIhTyBASGzRINpDYVwR2r3GTXtxjytoX2DTSrMJL7RieGNDHgJTAStapM
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812638fac.7.1794548047537;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812615fac.7.1794548047101;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:39 -0800
Subject: [PATCH v25 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261112-kaanapali-camss-v25-7-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX9cZkUXwcn3z5
 3qh+bEZe+JRbANA9c3pLssbKh2IWs849BnOhfRcY5MO51I0g6OqpywcKRVcD1GuB8utZKITCbC1
 z3zQiG2Gm2d8TqB0RhJ7E0z7EhR22m04cRMJ0Xr3groNry6BTmhtUVcgimI0zyLykaNaGV9XTbv
 r2IP61EJBFvZOwzXGq/+xN7vpmzwKuDrrzL0+WR+QCmveYOg85BxdE89T0Ze6mZbn/ULFh3/P9p
 PI7AvjtV57u1Qa0lUsnnn8Xzbma2qk/OmlreMaVWP8B1I896m/P9E/JK2FkYJR79bkwRtDAZLSB
 Uc3/WtgMRQXX0YH/zyfxeaIOzWcRCiwqB4b5pd4ypr0+JIym3+9K1wB5LADuZy5ZYFkzH0k3+Xw
 fMZbhrz7Pr5xVuvZmVjzmFDm3dRpZpMnyys+hh0xBU4cspfCGLD7hNHuLTa5T+m19tkcmWrGRbT
 jl5rh8Xl1JVNdHMJt7Q==
X-Proofpoint-GUID: Y4-8bzPo4bc678M8wpwC-vaJyZDo0Yoc
X-Proofpoint-ORIG-GUID: Y4-8bzPo4bc678M8wpwC-vaJyZDo0Yoc
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6a150 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX0jtFZ0p3M88m
 /CoZHSx/SpQ91tAShXeOMRtLjmJdkAoK99HMK7hGtpjHDXuyDZGKZsoc+JwvE8KE8ZTQbDNF9NU
 /FU0YA9EQbJ0xGA0r4Jhm25wjsZ6kYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cd6adf749c6f..f7b9c71cf263 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5602,6 +5602,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

