Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688501;
	b=ljOl9H0jxkcoxMgEVs1j/+yeNJFuv8UqNBrAfCndDer0mndJr97K454WAW18w57P/eBY
	 PN2yFRVOJETUQwoCnqBvBwWYEKBsqTIl4Rx9Y0BH5SMBUQVU/87UJA7jc6rohayRRi3gl
	 24KXXI7KrB601PRviChqfSko0VKJYkVr1Z8HI3JdF0c8+HIJi5kyz/Xe0xX7rcNogFE64
	 yYqhan07+q+aP1YS+Q+cMBs8S630Vrl7aKvTZt5Zz3Rxw/Kp/Dekhts+ushPHm2BH+mRy
	 iHvpszZNQTRw/YLEglV9wykh6s4QuhM/VVu3sdnJhp/TgelK/y3KWzNQuoDht8WK9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688501;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
	b=UgnrqrN4g6tz4AihmSBu+hNrhyNiZ4EEEwG8diyWwGRw3QeKFwnF2CxtlJj2K3eH/rxE
	 bzcXFCX7QmYRS9UznW45AC7zY4IbOisOIF4YTsJnYNSTXI+hRdtBNRTPKZ+vJt23N7pcA
	 VELZsWZGI9Vy5mj3pjQJy4cTjhaiUS2Dey3f+Hl89GwA6nli31J2M5mraGhlqlimqFKAD
	 znQBoiI9Wdr9Jh1H9nwTkVQDcu2fDh1lDRp01SKt9OczQ3+DhDpUPu3dLsZ0c56cVs2KD
	 q9Azs9+dlipi7sZlexYSaHo31M3B35GY3+vWm29usDrWbi0m+LeLjRb07Wi/cjpu0oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A05q+inE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dD8U2U/k";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3A606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F3A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A05q+inE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dD8U2U/k
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B1FF2175705
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=; b=A05q+inETtJuGRb9
	po6lXamGxSvspVQC8AB9/YdHmQTSzE3nkOSmFWDU1Q+kLbNVvYcZLt/TrX4Hpsok
	OYLqedtTAdTCN2nqK9+iOG3/X/FOhBgth+sqiqablx1xHznJ4YcvoLdRPoBXMbMm
	iCz11jeka8nHrQn3sl0cQU3S9pM8SRKit9vcfbYekLk0KGRtqQ5ftyzsLQrVj256
	xTOLlJ+3Y7ohVGLXzcyK5M14e3Pust0/+REMkucEBoqYxMz3RfkEW6UV9XxUYpE7
	77XSmN96oDE1aO0OCOMoqvMORUlwEYcYA3UyOao2lsP14emrtj9iI8iwQEQP2NA7
	7KDJLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuyx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1334370285a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688499; x=1796293299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
        b=dD8U2U/kjqVXuBwmzkmR37JGisTUZuTvq5w4IWfrfzNI0J74P9YuOC7B3EGIOn52xa
         PxTpz0i8ybpEC5oo874mQzFqfihP0M1CfnKZGpLadng2xojEJweIGHOImyfyhS4t7n2D
         U3ewPPCIIvn+Zi2McWYdoKpk0zPi9OXpMj05yqw7JuX+ldyQGyKbRYcDPWy/ffVXmT+j
         9ab8TFP0nvqDZDgnXZhCJzrW0Jydui+bM7qzlpJ1H4FM3QRDs7asnOnJA45+WRQ4FqDx
         qIZ5dJgzEjnLonoRJUDHs0k4UyhOguk1aELbmolzF1GLMugS3FiRwPs9ZQg9JvF58nPr
         ybQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688499; x=1796293299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0llbn1EpJF3f0GgglXjD3dkMdWIzIk15xH5hSErMFXU=;
        b=i9BSbabZzQTR3IAz/wq39mqqoX482qrGf2K7vezN5Maxh+8rQMIN9GdWRC6X1FLi+i
         TWJNV4nmy6gaT9+ul+MOwh74GYK8N9YpTJVi/NUvot4K/CqAecD78cTidLvpoTwf3vhr
         LEmy3zg+4oFh8kV1tsNZAdhjVMgXxELFto0suaSji9VdjLnUtNDvkfvBK0AktBsUOPPj
         wpm+U5eGyplXUtJZ1OaAt5asN56MxbWPjT4dswNUocMOYUZ3sh/08/xGsE/G4wMelSxB
         fqBlDRy7NbV8aVB5lH90wTC4D5tSvBe+Cn+Jn4RLFJWMm8f4IELrkfNtbCiGXLR0iy7I
         dNLA==
X-Forwarded-Encrypted: i=1; AL+hErG6IavGLvPukRfGZHjZVwhtjNX1KAFKNlJKpDq4Q+KZUIFyGljS6K9zWJQ3Jv2nrvKFGZgKk0pAy2tZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+O4vKDL6D+tONnCZY5tWoVrpCoHLDzPp4/FquRbSq1VAuJi+rq
	PhUFXZQ1H2lQGeGceU3MBoon1ZBKPZkW1veD1aYKXy0ZQ7fhpNPlvDPq5Xcxzy7ig19BP+kedPv
	4G8i8aG6gxt+L2S6m+JizGJZ1UgWIr3NhA6iVouVXt40PpJnWaWOGg9QCtdXcIot0
X-Gm-Gg: AZFdTZdicKF0qc1u/xgZlcTais/MjUWMTWtUfjiZUBLWfJ8XYcxoRPObP3kSFx0B3mS
	8mUOs+q2UVy6oD76GFaOwOexuL2CVUzAee4njPDZ8L21a6vdwrDqqiV/q0s7QlOD1DN5CbFtrUB
	09W8+Me1vtdZQDwqI48IDZsLMv5g6ys1ISAfsCRJrHkdslR3p7triN7MLhClpuMb51CNwGl3cp8
	1atkAqT2ZiA9/dy8HwTxPvq2B3oq+uKYEYJAmdRIHdwkU1zPRMAqs3XuYnTlyB4Ioqvub1ko/tm
	FNH2z1aop+0LfG8rWBSKSsdQWDOrLOe+KOHDsyEa+Y8IDZMaC/BRhLpq57agDDoLP6hM7/OzNR4
	/5cCQEjYP7QmNIcZWyTTxbv3D7ihKLo8tnY6RrPXOWqJZmSstL3tmJ5fiVOSHUQ/BukpnR6H65P
	VQrG8w05Jp2WFg+ak65iNoZQayaaYqHqDzTP4Ztk7kMCYeJWg2DpsIwhMujUpj6tg=
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr3269450585a.24.1795688498983;
        Thu, 26 Nov 2026 02:21:38 -0800 (PST)
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr3269447485a.24.1795688498433;
        Thu, 26 Nov 2026 02:21:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:15 +0100
Subject: [PATCH v2 11/11] pinctrl: qcom: sm8550: add the egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-11-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8211;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X57StljxrFqfhzlljzvvpjvWIl9o0MhcpLr1gtDzyQ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgU58Z9T4tJlXl81W3nAjEyJqnSrOlgWpO0P
 ANMqc7LaiaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w1uPD/9a4+oQrpI9hh1YwiMVAoheH2i752jhDgjCGPAvvxOdN/kOcY93SVXkDj7UOTHG+iwoNNd
 eXd0D6aLgoRpHwCQSRfV2/iYumOIq0vsD7bLzfVt9lLlcKOpZuWFJqlad7k8BJVDomT268O8+wp
 oUIvJX2NFY1sHpaCaA3C6qlugWlGhGcTMOq8AdAJ+yfIRcBdSPc3MzSkZhp+EZvzDutS263ARdL
 vml2kG6EkkX4VndUDjgVGhsUg/hr0rtzT6EGboN6s3TmnwHPSyBJWT23Gco93vxgpI87l5m2tj2
 XxDmCSFgQ3erNnaQUNaMJLqEFRcr/VWdJU3rvnpkyag34lq1hTLrP6DJTwPreShx8oOUZCX1FMl
 GeWHRwWjXeyqDDJa9Y38Vq5/UmNbnmWxv1N2Qoi+JzFZAxGMmOJQa39QvH2gx7UD1dVaI2IliTh
 3yD6MYdqReRVoKp79uiYMFjML6A5KEb/euvGJ9MGI/+yuZr5aNCCIbdoeLiw6S3g0irBB1NgKJR
 hRDfvfF+gO8YPMdFCgRrpDw6FMmx+9gheUkcWN1WkIeGzpcoLPaipUPAGlFn/LFiwHn4QySJIKB
 WfJYT4gyUdzUWrIcSjAr8G++YRmmLoG9KX0ISZyrtXVi2wGQNckxWbuyvt43DocYYuwcpEsRq3J
 YW6i1xF8T7BCqCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5rzAQYEc3Z7NvxZVCA0P2BNqGBvnIXwP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwlB+UYimctoM
 fEgPJMcs9cTaw9pZks6K6A8pYIDPbcarlnRRHtDRbklMGlIdTwUvDyNHY6TcH4yHIZ3uLxEbIsg
 aMp2PaKoJh2P6h+OhB0QFE42SQzNK7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX/l4ljxoJx2c0
 nKe/ETVrpwPEQRpuu/L0a3n8AYWEsyXC4h13ctnPmnquhPHqQCuNfYQSsxBO0V0nn47QhaegxBx
 AiT/NE0Gwar/HJzGGsdKsamlL4eFiUdjssI+00d5yvu2F15e8zy3LZctp2ifg7xz/M/z4I4plim
 PjC8avN7KFEeGIQMp3jQexsDZ8ef6QmL3U7XNVef9xW34mLHwAR3rsuiMw8LUYMLPY6RSvHnV6+
 kZcU8dBskyNGWgCmqWebLas7c9e96fgmcBgQeLO7K8yfTOEXJq4cUc5vDo5NyHx6q3KISuPnGRM
 NeOX5+Lfiu5kNkLE7oqe+WHBydo/Ns+hSzeKS9fjZf5rFDeyB5kvOYO2h7C6d7Btao2u5O6hZLu
 bDJlRJ4uKpH2wqAO0RGlEsp5rZWoymcM20Si2OWr/QdURq42mVD5h6VgJrk2Dbvdz44jtCRO7Kj
 m+VDx/T7t8tRYl0Ys5w==
X-Proofpoint-ORIG-GUID: 5rzAQYEc3Z7NvxZVCA0P2BNqGBvnIXwP
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080834 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rtxmPCpGaZ0uCJ4zFhEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The sm8550 driver sets .egpio_func but never defines the egpio function.
Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
back to the LPASS or SSC island.

Add the egpio function for GPIO 120 and GPIOs 165-209.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8550.c | 105 +++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index d12256d970a0c23142e3e633a1eae001e3a18958..b73ad324f883debc029417f15c783d4fe7b9aa93 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -568,6 +568,7 @@ enum sm8550_functions {
 	msm_mux_ddr_pxi2,
 	msm_mux_ddr_pxi3,
 	msm_mux_dp_hot,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -844,6 +845,17 @@ static const char *const dp_hot_groups[] = {
 	"gpio47",
 };
 
+static const char *const egpio_groups[] = {
+	"gpio120", "gpio165", "gpio166", "gpio167", "gpio168", "gpio169",
+	"gpio170", "gpio171", "gpio172", "gpio173", "gpio174", "gpio175",
+	"gpio176", "gpio177", "gpio178", "gpio179", "gpio180", "gpio181",
+	"gpio182", "gpio183", "gpio184", "gpio185", "gpio186", "gpio187",
+	"gpio188", "gpio189", "gpio190", "gpio191", "gpio192", "gpio193",
+	"gpio194", "gpio195", "gpio196", "gpio197", "gpio198", "gpio199",
+	"gpio200", "gpio201", "gpio202", "gpio203", "gpio204", "gpio205",
+	"gpio206", "gpio207", "gpio208", "gpio209",
+};
+
 static const char *const gcc_gp1_groups[] = {
 	"gpio86",
 	"gpio134",
@@ -1367,6 +1379,7 @@ static const struct pinfunction sm8550_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
@@ -1612,7 +1625,7 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[117] = PINGROUP(117, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
 	[118] = PINGROUP(118, qup2_se4, cci_timer, _, _, _, _, _, _, _),
 	[119] = PINGROUP(119, qup2_se4, cci_timer, phase_flag, _, _, _, _, _, _),
-	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, _),
+	[120] = PINGROUP(120, cci_timer, phase_flag, _, qdss_gpio, _, _, _, _, egpio),
 	[121] = PINGROUP(121, i2s1_sck, _, _, _, _, _, _, _, _),
 	[122] = PINGROUP(122, i2s1_data0, cmu_rng, _, _, _, _, _, _, _),
 	[123] = PINGROUP(123, i2s1_ws, _, _, _, _, _, _, _, _),
@@ -1657,51 +1670,51 @@ static const struct msm_pingroup sm8550_groups[] = {
 	[162] = PINGROUP(162, qlink2_request, qdss_cti, _, _, _, _, _, _, _),
 	[163] = PINGROUP(163, qlink2_enable, _, _, _, _, _, _, _, _),
 	[164] = PINGROUP(164, qlink2_wmss, _, _, _, _, _, _, _, _),
-	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _),
-	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _),
-	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _),
-	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _),
-	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _),
-	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _),
-	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, _),
-	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, _),
-	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, _),
-	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, _),
-	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, _),
-	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, _),
-	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _),
-	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, _),
-	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, _),
-	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, _),
-	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, _),
-	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, _),
-	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, _),
-	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, _),
-	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, _),
-	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, _),
-	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, _),
-	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, _),
-	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, _),
-	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _),
-	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _),
-	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, _),
-	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, _),
-	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _),
-	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _),
-	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, _),
-	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, _),
-	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, _),
-	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, _),
-	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _),
-	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _),
-	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _),
-	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _),
-	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, _),
-	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, _),
-	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, _),
-	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, _),
-	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, prng_rosc3, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, prng_rosc2, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, prng_rosc1, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, prng_rosc0, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, cri_trng, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, i2chub0_se8, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, aon_cci, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, aon_cci, _, _, _, _, _, _, _, egpio),
 	[210] = UFS_RESET(ufs_reset, 0xde000),
 	[211] = SDC_QDSD_PINGROUP(sdc2_clk, 0xd6000, 14, 6),
 	[212] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xd6000, 11, 3),

-- 
2.47.3

