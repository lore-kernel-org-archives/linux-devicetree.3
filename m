Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793011804;
	b=PoewQB995D7I3yvb19FLpDq5bAPQsqE3L1snIKFkGNzHRBQ+NQLhgDy4p9RksSW+mO8Y
	 XzW9pH22vvNt1NUfNPyS51M6nZngn+anzG9YrleOXbcNNFMVHA/M3gQCRbv9BtIBhQy5t
	 9cnl83qT8Tx87fxAo7jDDdPsNVeidHX2jnElUAaqu+qEvVbqnT4Q+0QyZwmlra0ZmgPpk
	 WgCogKl8Wrsg2y9Yt/YlD91ORsdrs3z27ZxDnP4G5weM52IeSj1W5iecszGD48rmivV3h
	 KBRyV0II7nvEZN/oNIo/QR4OYBNevloACFdd12Nag99ZoheHMCZhb7pQpkaGEyzFD3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QejenxWYa9M+khgrhEJbW4O8EWlyjJIqohWKnghei/g=;
	b=hwergBqHpLsnHtXJHaViWQYLzX1U4unoG0SR3MAs3Q5acDp/ZkLtGzxOLl7LBtiWBxKd
	 ZRswpS1J1cB0iuzbe9rU7zSU+HyvHS8jbLaqIIIlPpvsdZ57+K1bZUQySgkLNzhQ2q1qE
	 brv86HPUNKGHMREfToTop6VgkB4VsHtZoYQhKO1+otZAgl1Dd6IRqAe24+sixRAKXJnfp
	 SpCaXOpqek6N72MtTHXN8qCeBuQL5CeGtC4EYeMkNReI+FMXC3rLb3WwAnK9dOv2f/Kgp
	 XaIuUstCqKtptHf28qWz4UNEFLJ6CWmCMqUJUZH6Dit4sYSfHl7eSBHr/SeZElrif/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IurfTYVf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEe6ayBB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A68606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A68606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IurfTYVf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEe6ayBB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QActDs3300713
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QejenxWYa9M+khgrhEJbW4O8EWlyjJIqohWKnghei/g=; b=IurfTYVfhC5r+w7L
	OqUTiG7fCsx7oYwF6I9u4iL3b53fRYnvKakcWLxl322Sl3Fnv8e/84tQ4MG0cdGI
	uVhR1PYFH5aIowJx8bQ/lGY4CRul7USMYbDH7IuPqpJtvsDB+rx4sPt04mmcVtHl
	OH+DW5ac5+LpM89B/aoL4DKXAowOH5dqpaiIOqjdCeWB77DbF66oPIi4LqIdiBit
	2k/Dj4AjXdFP0fTgJyTwTisz/Z+NXZZ8d2q1Di6Ul0wmDEpsS0jbXff86bvLKI/G
	VYHa+8GnclwgCD6tZ2Ya4NYGSqn841ioBkrybImhYbPXRvTFlnmC9thWS8Tm6wEs
	aP27hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt19n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:50:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so516241585a.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793011802; cv=none;
        d=google.com; s=arc-20260327;
        b=QgvzUezUSFXfKFoMa27lbe188XgFxDj634PKdMfGaBEkD+l487RIk1OJEOqwo65/KI
         t9NVEKGDpCy03QIzLHm7BvJ4Jzd4DHkiNBKWTwSGgWq8DJjiUd6xIcRbd39m/RSjNHGT
         MEytawj2e0wjGp/gvRAdau75lxDFoHUG+i+PvrWbnTjzcsE+w/eGciTob1RIm7kI/8eA
         xFCn5xM/N4UUROuECmILnWQKn6a4/JpkkteORs0U/YUrEUK80ETP8TMC6sbF9Wk2DWvj
         mEb+A/EYd1labaBgKMHBzrrLr5TtfyUDNXO3HUUomb/BAEJ4WxRYe7ZSd8W24iGt1F6Y
         UGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QejenxWYa9M+khgrhEJbW4O8EWlyjJIqohWKnghei/g=;
        fh=dwmAtv400tq+8qadcB8MAQmG+82Ce2uQFtHcIA+Jooc=;
        b=fhXE9hx+GVOo24Ph7R1ZEO7l9/clwEZfJ/8mENi+/r2fhu/ogVD1eD0hnkA08RSwR/
         UWZ4d9nqBaFMYN2MxL//lO4ZpBwrvYZ90WKh83GEMuQtAHUWMVaEmVrIVA15IC1XR/AP
         6BrHs8r338A62OkYbUKx3raOGQSXQaNQ+Shzj6S99j+I9bz5De+8CkVoAaAr4vFgc6us
         L56IQs4T3p32gvcurTTbVmHHYDsdhcPIp8z9LdVHE6eJT41avKU3R12TNjJaDWT4cVWI
         ObMZWgM1XuHPwZioih6SCTr57K4j/1gu7LXk5CyRaiV+OdYRPSmsKX/trJ+1c4W5vEbh
         mjFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011802; x=1793616602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QejenxWYa9M+khgrhEJbW4O8EWlyjJIqohWKnghei/g=;
        b=bEe6ayBBCHmX8d1YwwvqAX69IeN7o1bcLLmhoMqw5+yYadQXRsFZ6sgNGMVvUsxq3C
         Cz6QKt1WmknF1jqw6EWuYTytEfn4Wx0NxsV27M93wD94D8TbVLPZJ1sMClo5mFRifdfy
         OEQ3Wc6QkZ92NBWrrtgeHy4qKb6px9wmW/zbhUqeuBj5DIp8iuo/Zcsfh775xWTpqXgM
         6gsOsg8o3U0YB+J38QtAFR4CyvoQKypxFluYbvfpjIqS5RpkUExtVIsvkTVqNwx01VUs
         XiMefm/UqIElmzamDxaea8JxOxUpXDW0vMk3oaXNsPVPZjm92ps6yhe3yeYzN0xDgbtJ
         9QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011802; x=1793616602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QejenxWYa9M+khgrhEJbW4O8EWlyjJIqohWKnghei/g=;
        b=j4imvOjaHH1wqJMiRC5DpymtQLLvu4kKcH3ia7Nc7rRgdpXgVrGnnXaKwegXBMK2mO
         JZF6ZfjI+ElOhv3/XqJeiDKBo56lfxBhe6FsjIMrGyeyY9AbdtCzauCH+Ih+3krVf3RQ
         IV+u9/WsoYV8n+lwUNdEhOGYcsWwmklGj4htDU7gPHWZ6Av6PqFQ4wJdCKKyoX793EbT
         3TqO+p9cdYMACwXynT7e3XZezHevJeolXlRxavD7fvxkVatmZJq5MKS/IyNnktMK6t80
         Y3HEy3DpxKS63QiSY291Xyc+s0JcxQ4BVQbtHbWGlivgZd4wLyWkMLNg4WpsYRlL1ScH
         t3FA==
X-Forwarded-Encrypted: i=1; AKwUvBy6Y+Nu25VWCCXy+YDVR+cHkE9AwTf0wUFqlnFcubtjKFL6Fw3y6HPzrN7m8EVkr9eynllTID/XKLao@vger.kernel.org
X-Gm-Message-State: AFq9FYJTsGfUdTbCDtvIHOiljbxLi45Kf1t3NAiwSNkj7NA25JRyBr9j
	Pp3iXgdBDx1BQqsJ9AY41V6Ytv73PWBfIBDNRfasL0eXQUQJ9tnV/aUXECRfvauAVZxn/Z5yGvE
	ZfPh8Y1bTnHzHw4YITlqz0Es1nlVOgamF53vw4zQJq+2MQbIY+n/SDh8TvqX8Y1PGLBORN2RnOh
	wa1gFF/ghHUzQc+EjqiW44REfXY+WW1XKd8UhBsp0=
X-Gm-Gg: AYBFou3Z1NiJhvfSv8mZf3ziFv6P2TBjibADrMkqI5jsDsMDTlZiQm7v2ChdNh6uwPE
	yMnEULW9kgQNkoACYIsQ88y/ATswWfjcc2X8sE0xEcMBOnz07De1Ay5NGlfS00vuvhnw5JdhHB7
	3KBN8X7iSKBaYO271tgmuH9qsF4tkz0SO9LR08NKoTFwZcB9l/w4iP7qtJTnirjNVfcSzt1DIfM
	37Z6T7iK8tycOXSIPIyORLtMIlqi6KfedyvFS81qW3I10AoBRSLpF8hk153nur6hPC4NpQ6H9EF
	za2wed5zlue8diz2O3Tetf9tEKVT
X-Received: by 2002:a05:620a:649b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-940ef9e41cbmr908462785a.80.1793011801786;
        Mon, 26 Oct 2026 03:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:649b:b0:93e:c12c:9dd0 with SMTP id
 af79cd13be357-940ef9e41cbmr908459285a.80.1793011801243; Mon, 26 Oct 2026
 03:50:01 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:49:49 +0100
X-Gm-Features: AclHuK-SK4jFNaYaLq--4p96jXxua1uXM9mabCbSu1EN8fLtJgZF6_IRwe5h5uw
Message-ID: <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfX94WaPhatvSUn
 CVfEYwWqf2fmm5H6yExaebuPwEJQP2DYMBYHEVfM7iykkgkKKog45EM6g6I5nGLsxcMNPLtvVuU
 UiOvKW9YFhn0NhdfnmQWELQ4y/TnLSc=
X-Proofpoint-GUID: O-iSXRgFuWsB8HttCx232_0i2FJooy3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MyBTYWx0ZWRfX3nYEHsDkF4T7
 1dyPgQHAHaOhNw1l7b3CUfMoFLfbUyewMQh2C6ZbhS3Jj7fZQa7qcH43WO6+0BJmoZsp6i4uSDd
 G88cgovzBIQILPQNgS+rKHrcoKXHqWyhXq2fnyIPqV3fvcEvULPQlT7LPL4GZm5wGLkA3nrSWFK
 CnbD+N42sBMTmFVA2LU5nGsRGig00Og4o1MmJP4iOFcf+gvFk/eK46VUmByU96FakU1gn6vC767
 /KZWoeCKRa/FVPWu0XMo8IMfZqelNo3RdIdFhFxjeFzWcduaWdDuoGlbwXkjG+IAwILtTWi7hhx
 ZUK8paRFnegmGdisxum+xCYZpwkO+Gzrazk4SVfNNxTGFfvW07aLFK6yR85zViMNRNnZ6vv5khQ
 mBC5LIaJqZCAqsQOP7Svk3FmqzH1UdMAZQ3UhpfTqhcA8qhTGwYNbVrrZhUflswWC1DDgvXtrH7
 0S32Je37ogtJJb69OTA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf305b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=DRRBbasCgIJkhilYQr8A:9 a=oAGWM7O9vgNgu-T_:21 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: O-iSXRgFuWsB8HttCx232_0i2FJooy3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260043

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add support for the CSID 1080 hardware found on the Kaanapali SoC.
>
> Introduce the CSID 1080 hardware resource descriptions and implement
> the hardware-specific register programming, reset sequence, and
> BUF_DONE interrupt handling.
>
> CSID 1080 uses separate registers for RUP and AUP updates, with a SET
> register used to commit them. Extend the CSID interface to support this
> scheme while retaining the legacy combined reg_update mechanism.
>
> Also define the INFO_INPUT_EOF and INFO_CAMIF_EOF bits in the per-RDI
> IRQ status register alongside the existing SOF bits, as well as
> TOP_IRQ_STATUS_RDI_OFFSET for RDI0 in the top-level IRQ registers.
> These definitions are added for completeness and don't enable SOF or
> EOF interrupts.
>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile         |   1 +
>  .../media/platform/qcom/camss/camss-csid-1080.c    | 402 +++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
>  drivers/media/platform/qcom/camss/camss.c          |  75 ++++
>  4 files changed, 486 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/p=
latform/qcom/camss/Makefile
> index 27898b3cc7d3..218ba3a95939 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,6 +8,7 @@ qcom-camss-objs +=3D \
>                 camss-csid-4-7.o \
>                 camss-csid-340.o \
>                 camss-csid-680.o \
> +               camss-csid-1080.o \
>                 camss-csid-gen2.o \
>                 camss-csid-gen3.o \
>                 camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 000000000000..9830fa0f8d24
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen3.h"
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CFG                           0x108
> +#define                RST_MODE                                BIT(0)
> +#define                RST_LOCATION                            BIT(4)
> +
> +/* Reset and Command Registers */
> +#define CSID_RST_CMD                           0x10C
> +#define                SELECT_HW_RST                           BIT(0)
> +#define                SELECT_IRQ_RST                          BIT(2)
> +#define CSID_IRQ_CMD                           0x110
> +#define                IRQ_CMD_CLEAR                           BIT(0)
> +
> +/* Register Update Commands, RUP/AUP */
> +#define CSID_RUP_CMD                           0x114
> +#define CSID_AUP_CMD                           0x118
> +#define                CSID_RUP_AUP_RDI(rdi)                   (BIT(8) <=
< (rdi))
> +#define CSID_RUP_AUP_CMD                       0x11C
> +#define                RUP_SET                                 BIT(0)
> +#define                MUP                                     BIT(4)
> +
> +/* Top level interrupt registers */
> +#define CSID_TOP_IRQ_STATUS                    0x180
> +#define CSID_TOP_IRQ_MASK                      0x184
> +#define CSID_TOP_IRQ_CLEAR                     0x188
> +#define                INFO_RST_DONE                           BIT(0)
> +#define                CSI2_RX_IRQ_STATUS                      BIT(2)
> +#define                BUF_DONE_IRQ_STATUS                     BIT(3)
> +#define                TOP_IRQ_STATUS_RDI_OFFSET               16
> +
> +/* Buffer done interrupt registers */
> +#define CSID_BUF_DONE_IRQ_STATUS               0x1A0
> +#define                BUF_DONE_IRQ_STATUS_RDI_OFFSET          16
> +#define CSID_BUF_DONE_IRQ_MASK                 0x1A4
> +#define CSID_BUF_DONE_IRQ_CLEAR                        0x1A8
> +#define CSID_BUF_DONE_IRQ_SET                  0x1AC
> +
> +/* CSI2 RX interrupt registers */
> +#define CSID_CSI2_RX_IRQ_STATUS                        0x1B0
> +#define CSID_CSI2_RX_IRQ_MASK                  0x1B4
> +#define CSID_CSI2_RX_IRQ_CLEAR                 0x1B8
> +#define CSID_CSI2_RX_IRQ_SET                   0x1BC
> +
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0                      0x880
> +#define                CSI2_RX_CFG0_NUM_ACTIVE_LANES           0
> +#define                CSI2_RX_CFG0_DL0_INPUT_SEL              4
> +#define                CSI2_RX_CFG0_PHY_NUM_SEL                20
> +#define                CSI2_RX_CFG0_PHY_SEL_BASE_IDX           1
> +#define CSID_CSI2_RX_CFG1                      0x884
> +#define                CSI2_RX_CFG1_ECC_CORRECTION_EN          BIT(0)
> +#define                CSI2_RX_CFG1_VC_MODE                    BIT(2)
> +
> +#define MSM_CSID_MAX_SRC_STREAMS_1080          (csid_is_lite(csid) ? 4 :=
 5)
> +
> +/* RDI Configuration */
> +#define CSID_RDI_CFG0(rdi)     (csid_is_lite(csid) ?\
> +                                       (0x3080 + 0x200 * (rdi)) :\
> +                                       (0x5480 + 0x200 * (rdi)))
> +#define                RDI_CFG0_RETIME_BS                      BIT(5)
> +#define                RDI_CFG0_TIMESTAMP_EN                   BIT(6)
> +#define                RDI_CFG0_TIMESTAMP_STB_SEL              BIT(8)
> +#define                RDI_CFG0_DECODE_FORMAT                  12
> +#define                RDI_CFG0_DT                             16
> +#define                RDI_CFG0_VC                             22
> +#define                RDI_CFG0_EN                             BIT(31)
> +
> +/* RDI Control and Configuration */
> +#define CSID_RDI_CTRL(rdi)     (csid_is_lite(csid) ?\
> +                                       (0x3088 + 0x200 * (rdi)) :\
> +                                       (0x5488 + 0x200 * (rdi)))
> +#define                RDI_CTRL_START_CMD                      BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)     (csid_is_lite(csid) ?\
> +                                       (0x3094 + 0x200 * (rdi)) :\
> +                                       (0x5494 + 0x200 * (rdi)))
> +#define                RDI_CFG1_DROP_H_EN                      BIT(5)
> +#define                RDI_CFG1_DROP_V_EN                      BIT(6)
> +#define                RDI_CFG1_CROP_H_EN                      BIT(7)
> +#define                RDI_CFG1_CROP_V_EN                      BIT(8)
> +#define                RDI_CFG1_PACKING_FORMAT_MIPI            BIT(15)
> +
> +/* RDI Pixel Store Configuration */
> +#define CSID_RDI_PIX_STORE_CFG0(rdi)   (0x5498 + 0x200 * (rdi))
> +#define                RDI_PIX_STORE_CFG0_EN                   BIT(0)
> +#define                RDI_PIX_STORE_CFG0_MIN_HBI              1
> +
> +/* RDI IRQ Status in wrapper */
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0x224 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0x228 + (0x10 * (rdi)))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0x22C + (0x10 * (rdi)))
> +#define                INFO_RUP_DONE                           BIT(23)
> +#define                INFO_INPUT_SOF                          BIT(12)
> +#define                INFO_INPUT_EOF                          BIT(9)
> +#define                INFO_CAMIF_SOF                          BIT(4)
> +#define                INFO_CAMIF_EOF                          BIT(3)
> +
> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +       /* trigger SET in combined register */
> +       writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_addr_update(struct csid_device *csid, int port_id)
> +{
> +       csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +       writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +       __csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_addr_update_clear(struct csid_device *csid, int port_=
id)
> +{
> +       csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +       csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +       writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +       __csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update_clear(struct csid_device *csid, int port_i=
d)
> +{
> +       csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +                               struct csid_phy_config *phy)
> +{
> +       u8 lane_cnt =3D phy->lane_cnt;
> +       int val;
> +
> +       if (!lane_cnt)
> +               lane_cnt =3D 4;
> +
> +       val =3D (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +       val |=3D phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +       val |=3D (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +              << CSI2_RX_CFG0_PHY_NUM_SEL;
> +       writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +       val =3D CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +       writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
> +{
> +       int val;
> +
> +       if (vc > 3) {
> +               val =3D readl(csid->base + CSID_CSI2_RX_CFG1);
> +               val |=3D CSI2_RX_CFG1_VC_MODE;
> +               writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +       }
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi=
)
> +{
> +       int val =3D 0;
> +
> +       if (enable)
> +               val =3D RDI_CTRL_START_CMD;
> +
> +       writel(val, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 =
rdi)
> +{
> +       u32 val;
> +
> +       /*
> +        * Configure pixel store to allow absorption of hblanking or idle=
 time.
> +        * This helps with horizontal crop and prevents line buffer confl=
icts.
> +        * Reset state is 0x8 which has MIN_HBI=3D4, we keep the default =
MIN_HBI
> +        * and just enable the pixel store functionality.
> +        */
> +       val =3D (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN=
;
> +       writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +       u8 lane_cnt =3D csid->phy.lane_cnt;
> +       u32 val;
> +
> +       /* Source pads matching RDI channels on hardware.
> +        * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +        */
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
> +       const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
> +                                                                  csid->=
res->formats->nformats,
> +                                                                  input_=
format->code);
> +
> +       if (!lane_cnt)
> +               lane_cnt =3D 4;
> +
> +       val =3D RDI_CFG0_TIMESTAMP_EN;
> +       val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> +       val |=3D RDI_CFG0_RETIME_BS;
> +
> +       /* note: for non-RDI path, this should be format->decode_format *=
/
> +       val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +       val |=3D vc << RDI_CFG0_VC;
> +       val |=3D format->data_type << RDI_CFG0_DT;
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
> +
> +       val =3D RDI_CFG1_PACKING_FORMAT_MIPI;
> +       writel(val, csid->base + CSID_RDI_CFG1(port));
> +
> +       /* Configure pixel store using dedicated register in 1080 */
> +       if (!csid_is_lite(csid))
> +               __csid_configure_rdi_pix_store(csid, port);
> +
> +       val =3D 0;
> +       writel(val, csid->base + CSID_RDI_CTRL(port));
> +
> +       val =3D readl(csid->base + CSID_RDI_CFG0(port));
> +
> +       if (enable)
> +               val |=3D RDI_CFG0_EN;
> +
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +       u8 i, k;
> +
> +       __csid_configure_rx(csid, &csid->phy);
> +
> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +               if (csid->phy.en_vc & BIT(i)) {
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx_vc(csid, 0);
> +
> +                       for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
> +                               __csid_addr_update(csid, i);

Do we really need to trigger the same AUP several times (one per
buffer in the FIFO)? could we have a small comment on why?
Isn't this already done from the vfe_enable_output helper?

> +
> +                       __csid_reg_update(csid, i);
> +
> +                       __csid_ctrl_rdi(csid, enable, i);
> +               }
> +       }
> +}
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 =
val)
> +{
> +       return 0;
> +}
> +
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear)
> +{
> +       if (is_clear)
> +               __csid_reg_update_clear(csid, port_id);
> +       else
> +               __csid_reg_update(csid, port_id);
> +}
> +
> +static void csid_subdev_addr_update(struct csid_device *csid, int port_i=
d, bool is_clear)
> +{
> +       if (is_clear)
> +               __csid_addr_update_clear(csid, port_id);
> +       else
> +               __csid_addr_update(csid, port_id);
> +}
> +
> +/**
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +       struct csid_device *csid =3D dev;
> +       u32 val, buf_done_val;
> +       u8 reset_done;
> +       int i;
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_STATUS);
> +       writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +       reset_done =3D val & INFO_RST_DONE;
> +
> +       buf_done_val =3D readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +       writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +               if (csid->phy.en_vc & BIT(i)) {
> +                       val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
> +                       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
> +
> +                       if (val & INFO_RUP_DONE) {
> +                               __csid_addr_update_clear(csid, i);
> +                               __csid_reg_update_clear(csid, i);
> +                       }
> +
> +                       if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OF=
FSET + i))
> +                               camss_buf_done(csid->camss, csid->id, i);
> +               }
> +       }
> +
> +       val =3D IRQ_CMD_CLEAR;
> +       writel(val, csid->base + CSID_IRQ_CMD);
> +
> +       if (reset_done)
> +               complete(&csid->reset_complete);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/**
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csid_reset(struct csid_device *csid)
> +{
> +       unsigned long time;
> +       u32 val;
> +       int i;
> +
> +       reinit_completion(&csid->reset_complete);
> +
> +       val =3D INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +       writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +       val =3D 0;
> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> +               if (csid->phy.en_vc & BIT(i)) {
> +                       /*
> +                        * Only need to clear buf done IRQ status here,
> +                        * RUP done IRQ status will be cleared once isr
> +                        * strobe generated by CSID_RST_CMD
> +                        */
> +                       val |=3D BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +               }
> +       }
> +       writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +       writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
> +
> +       /* Clear all IRQ status with CLEAR bits set */
> +       val =3D IRQ_CMD_CLEAR;
> +       writel(val, csid->base + CSID_IRQ_CMD);
> +
> +       val =3D RST_LOCATION | RST_MODE;
> +       writel(val, csid->base + CSID_RST_CFG);
> +
> +       val =3D SELECT_HW_RST | SELECT_IRQ_RST;
> +       writel(val, csid->base + CSID_RST_CMD);
> +
> +       time =3D wait_for_completion_timeout(&csid->reset_complete,
> +                                          msecs_to_jiffies(CSID_RESET_TI=
MEOUT_MS));
> +
> +       if (!time) {
> +               dev_err(csid->camss->dev, "CSID reset timeout\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +       csid->testgen.nmodes =3D CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_1080 =3D {
> +       .configure_stream =3D csid_configure_stream,
> +       .configure_testgen_pattern =3D csid_configure_testgen_pattern,
> +       .hw_version =3D csid_hw_version,
> +       .isr =3D csid_isr,
> +       .reset =3D csid_reset,
> +       .src_pad_code =3D csid_src_pad_code,
> +       .subdev_init =3D csid_subdev_init,
> +       .reg_update =3D csid_subdev_reg_update,
> +       .addr_update =3D csid_subdev_addr_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 2f7e593defed..603621c16315 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -162,7 +162,13 @@ struct csid_device {
>         void __iomem *base;
>         u32 irq;
>         char irq_name[30];
> -       u32 reg_update;
> +       union {
> +               u32 reg_update;
> +               struct {
> +                       u32 rup_update;
> +                       u32 aup_update;

I would say keep it simple and just add addr_update field after reg_update.


> +               };
> +       };
>         struct camss_clock *clock;
>         int nclocks;
>         struct regulator_bulk_data *supplies;
> @@ -224,6 +230,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>  extern const struct csid_hw_ops csid_ops_4_7;
>  extern const struct csid_hw_ops csid_ops_340;
>  extern const struct csid_hw_ops csid_ops_680;
> +extern const struct csid_hw_ops csid_ops_1080;
>  extern const struct csid_hw_ops csid_ops_gen2;
>  extern const struct csid_hw_ops csid_ops_gen3;
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 0358ee384012..7acace363fc2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -83,6 +83,79 @@ static const struct camss_subdev_resources csiphy_res_=
kaanapali[] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csid_res_kaanapali[] =3D {
> +       /* CSID0 */
> +       {
> +               .clock =3D { "csid", "csid_csiphy_rx" },
> +               .clock_rate =3D { { 400000000, 480000000 },
> +                               { 400000000, 480000000 } },
> +               .reg =3D { "csid0" },
> +               .interrupt =3D { "csid0" },
> +               .csid =3D {
> +                       .is_lite =3D false,
> +                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> +                       .hw_ops =3D &csid_ops_1080,
> +                       .formats =3D &csid_formats_gen2
> +               }
> +       },
> +       /* CSID1 */
> +       {
> +               .clock =3D { "csid", "csid_csiphy_rx" },
> +               .clock_rate =3D { { 400000000, 480000000 },
> +                               { 400000000, 480000000 } },
> +               .reg =3D { "csid1" },
> +               .interrupt =3D { "csid1" },
> +               .csid =3D {
> +                       .is_lite =3D false,
> +                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> +                       .hw_ops =3D &csid_ops_1080,
> +                       .formats =3D &csid_formats_gen2
> +               }
> +       },
> +       /* CSID2 */
> +       {
> +               .clock =3D { "csid", "csid_csiphy_rx" },
> +               .clock_rate =3D { { 400000000, 480000000 },
> +                               { 400000000, 480000000 } },
> +               .reg =3D { "csid2" },
> +               .interrupt =3D { "csid2" },
> +               .csid =3D {
> +                       .is_lite =3D false,
> +                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> +                       .hw_ops =3D &csid_ops_1080,
> +                       .formats =3D &csid_formats_gen2
> +               }
> +       },
> +       /* CSID_LITE0 */
> +       {
> +               .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +               .clock_rate =3D { { 400000000, 480000000 },
> +                               { 400000000, 480000000 } },
> +               .reg =3D { "csid_lite0" },
> +               .interrupt =3D { "csid_lite0" },
> +               .csid =3D {
> +                       .is_lite =3D true,
> +                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> +                       .hw_ops =3D &csid_ops_1080,
> +                       .formats =3D &csid_formats_gen2
> +               }
> +       },
> +       /* CSID_LITE1 */
> +       {
> +               .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +               .clock_rate =3D { { 400000000, 480000000 },
> +                               { 400000000, 480000000 } },
> +               .reg =3D { "csid_lite1" },
> +               .interrupt =3D { "csid_lite1" },
> +               .csid =3D {
> +                       .is_lite =3D true,
> +                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> +                       .hw_ops =3D &csid_ops_1080,
> +                       .formats =3D &csid_formats_gen2
> +               }
> +       }
> +};
> +
>  static const struct resources_icc icc_res_kaanapali[] =3D {
>         {
>                 .name =3D "ahb",
> @@ -5652,9 +5725,11 @@ static const struct camss_resources kaanapali_reso=
urces =3D {
>         .version =3D CAMSS_KAANAPALI,
>         .pd_name =3D "top",
>         .csiphy_res =3D csiphy_res_kaanapali,
> +       .csid_res =3D csid_res_kaanapali,
>         .icc_res =3D icc_res_kaanapali,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
> +       .csid_num =3D ARRAY_SIZE(csid_res_kaanapali),
>  };
>
>  static const struct camss_resources msm8916_resources =3D {
>
> --
> 2.34.1
>
