Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574B3D75C2
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363763; cv=none; b=Biq58+1XhxG/iR1cP2W4y9ICXlRNwNsrMdl08TUleiLJZDPBLDaI+v6U5SgH7Dj/De9k+IXj+kysBxSM8V58pRjFarigIXUiEK3QVyTt/AjZJrF7c5H2k636zMm42+o6iFTPn8lOYtbAtju15RG6x0zZN65tRNqvWLGsdPOIC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363763; c=relaxed/simple;
	bh=V1+LIzhsNCYGghySNC0huQ8BjohirEoPB9lOPfSjmNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aWgns0pMP6G0nMDMXVAexKXqNi6oxcfrm4qscY44+rr0FFZFmJ7ArpNcWrSSXrzKfToVEJihLNVio+FCVuSiZPCLE2pIxyb6z6iufnFC4G/MnjSegB7zk0nCovv0AfZRKyeKIuxXj/rNZ4oKKZvZ5zC4wc0P9HkO3Mti1yNokQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2/FpBNM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2/FpBNM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jdTk3811009
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAbK+q4lPjl
	daIW60C/b3RXYI3mjruIC3tTZr7L08yQ=; b=I2/FpBNMsAE2T7Myntk2s+fk+xz
	mXWDmacwlp+99yQAGAUARMVGXFpnRb8gotJd/M9zLKP7VxV/A7u734it/SpN24L6
	H0A0rII5hb2kkBPN0uTD/hKa6oPrht12k6vyq0MQRtqARQDw3AQEOxm1CxpkSBKu
	gSCzO3Q1S8F2VhITuJqF1M+rvi5TJAU4I2sjkAcFVFtvG6vwOrwebv6t3Ia94Iml
	TNvwkO//uJmImKmEtCHkGjXNRxIXvjZKHT86AVP8Es12jRyB0hLzJdlv2p9F6U1M
	ts+qRBkemifnj9EBOmOis5ynAPOPBiU+u6Q74x/fEyc68l1FgGg37mTe+yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrg55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso738909785a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363732; x=1791968532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAbK+q4lPjldaIW60C/b3RXYI3mjruIC3tTZr7L08yQ=;
        b=ntyl+kabu/+/Hhw+qR0PlSPF2DZDCcFZa4qXfmzY6HM/xp+u1nf+ZzTz1kQ+0cApmY
         8h9jNnjCfxEEXFOVsRK+5gptl7cgMuLYBNJRlarZDrQDBIXGc5mv/uc2WkT6zDUErU6/
         qy1fThu/zwz07XcdcvTJQ25/zVg3twu21zMFBbGkpZKxNmO/WHkPmsSyPKAhzjOAYOm6
         2+QOpBLjJeiW1nquy+m7niI4eLiok+FsWNufCFK0t+fCgKuYND3NFZeqd9OnPBrX8694
         iRyY4Dov1bVPQDKvW3hNJ04BQOC2opyp3P7BYBRorkfaAz9luCT0p5h2JGzkeEHR+mL3
         /1Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxax1niQ1/1FqR3AR1qaZ8WHxQ3WtK7vJbBj1nhJ7Resf+fhrriK0kBt3DClWhnJ3fumQuuKVDFmiC2@vger.kernel.org
X-Gm-Message-State: AFuF++n0jDYngaM4ZWWy6wZemnZiqd17r/ExpDqpfg75z8TNXTbYH6uE
	70oC5oL4A/fERVhxfq7VxjO0TZg1FOAexgpsd7htWII0B++tK7Pby4VH8SxUHlUfImfWAZNZNim
	YPeQxqH3kn2ChR+CnTncrvina5ZCCHyopq8lHk9YmBe8zHY/UOx5gfTvZXxjZg7AV
X-Gm-Gg: AYBFou2TPDpH12tRKADLTC+sQbFo1ZuxvU+GnOMePoQGWdU8GyJLeinlLvKf6V1HF3W
	Ofw3v/0Ka0RY9qgNIcoS8zxE4Tqu4BE+vh7NruZ7l+yfS2MDD30xSchaYJPmk3epXTFYx1RoUYb
	Fh+09/SIFnKfbDvJYVlW1DiJ8/XaozuXVusffk/IabeKiIaHXO6a82UUBYnSlpU1bR+9zJEXEe0
	OwZ/zxuVC6xzNUFzUE///gWczMI3UtML4PEVPWwwiq+iD6u7XVN/HeveAKm4LH/yNKXC6ytQ9RZ
	eoa87kh1YtdcY2RgJVnm7I2ZEhaSF6Ofs8LmyqMKd444naPZHspHe4/hfJc=
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447760985a.40.1791363732270;
        Wed, 07 Oct 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447757485a.40.1791363731820;
        Wed, 07 Oct 2026 02:02:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 24/45] arm64: dts: qcom: use SM8250 IFE resources
Date: Wed,  7 Oct 2026 12:00:20 +0300
Message-Id: <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60a94 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ucHQKD9_QHzbuw8IWkIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: y3E-MQFDM9cXnaYMxUAh2itnc7xIHYwt
X-Proofpoint-GUID: y3E-MQFDM9cXnaYMxUAh2itnc7xIHYwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyzGakyerkkty
 N2q2mQa36XdKk614xFIJbsAVxBsHjnoq6btZx1KBfrVZVqQ7g0dXGzDgcMoJsEz7xQvcr6SZLqt
 2qIhpxiQLHSfkb0qzPCoJow1a4ZO0ufS4LhO7/nNLvylWymZg/sdFRPn8Tv7rdJPlu9eBixJJiW
 EU2rmTnIWrOQSOLFJ6Z8qK4goIvaJHVoUMXNMTqEBbq5PxH26hKI2k/XknpkrXpwu9M9BxHgVWl
 VJkkbG9YW59us0K18a/DIvJjosUR92GKxoLKyBu3om2LY+Ccd1gvdYY6qaHu0mnnQewYBAYmxmv
 tl3pch174lTf2Xwf+lj9ycP37nRtIa+BXAM+v2esA1B3QzFlHij9a70M7HbUQjzbR8LBs6aClXS
 CznZ/5z0jJFg5+xuUeaC6rkYwioGbFiFrKe5tlZ4DfqYaeISB8V4hVOnnjxLlywXZKpCpERs3cn
 XLG6oQQtFYAWqWnA1Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX62mtH+hoa5H0
 kCs1ldxHO5OdOQMFPF+5IxPmJvKIDS9GkZ7uiUcgLaXNTxpP2mzM2UWxa9w+AKIJ9skvtre59wz
 B7o37wcG1Tl+War8v+SlWtwthD2nI5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..21550d25ebe8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4487,7 +4487,7 @@ cci1_i2c1: i2c-bus@1 {
 		};
 
 		camss: camss@ac6a000 {
-			compatible = "qcom,sm8250-camss";
+			compatible = "qcom,sm8250pix-camss";
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
-- 
2.34.1

