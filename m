Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A427F017
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726435; cv=none; b=GDXxtIfTWyEvPsFVhL58foDtg2inPjqxwArrB9KEHOqApJt1LxMLUsFzU/OlUXCav4khg2WYMZpq/jfc/RZypa1cYWrdh0AKVedK5IzlFwLPWyxaV81c5WJtZI+gzIwZhrGNe4pJzcG1YsrkJJiG52TaqGmGa77lsAgz0//EptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726435; c=relaxed/simple;
	bh=Ib2fFpGA8HXSvCdKaT+K1frPjV6b7O+Vuez/aXtxX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQPYFnzcQdULMdtnO51CVDIXgEzvCw9KD6LwRcMWR5vxObooUkI3k0PfXTJ4enYubUvBZyutnR7M/TAmN4j92yb0fwl5o0csYdSq0Yi6VOg+5dS+o7+iuNsyEPoPineAYUxlnGg8U/hxYTEbtpwqLrM+24rpBvfACYW0BFvHXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOuVGQZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhTmRs2u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOuVGQZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhTmRs2u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1V1A1082297
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rIMkbAY2u/8YcCwRUcpBFhYi
	OZxj0l75/x2ZVLsA0S0=; b=gOuVGQZXUOAI9gR07CVmntFHO/D/BMf5OOKh6cAn
	M7zA/9GG/q+fri7cpTjqHWUWBQVoYf9K/N5qq87Ny218V+17xAU5J1AeNqZUm323
	cs9gOQyvJX24HLjr64uKE8aF9hgjter/DOgz9Rk5mPghfnluklueg1PZJGGBPO4m
	0DwkAjjquWgBFP/RQfRtOlnTSl3M32RCYVgqinhQABR5pA4P1/8fjEkQtjZjm3iJ
	hhAz7bqSe1U7tDaWkHwXmpNKiX+8c59wImhD0NVMhD7xj9lTXnlgHgU6Nr/n+P2/
	58aKxEHfnS7m+abiG2z9AoKZAQsmN9drgpAxo/XQzh/M5w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1kjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:20:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-971ff89d7eeso1781398241.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726432; x=1785331232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIMkbAY2u/8YcCwRUcpBFhYiOZxj0l75/x2ZVLsA0S0=;
        b=KhTmRs2uuE/7POoUXY3WKzd8gsrkbD1GX4OTbo+feWsjAyF+NOL4CeZBFtkXTSRv7G
         h40EkZP8X4XlcoZpVmy7e6iTGd8e9G1as2dJtYdRGs/Td/To8deMAAchhOY0IodbNJtR
         r41w4gmI3WVeYKv56ohgG9iqTQC9IssyPloxCn4HMYJWzEYrVDAUhzsYTzNHWJpp0ksB
         zdWQ0Gvn5oWPWTn8rQYYsFPTv+gsqw+H2Eg32CBNE0SNienp6VSpVQxf7yTzBmhkVv2k
         d2tbh8xJptJA5MoR/nT24lC0OklRf53aOFtehGwlj1xbHAJHyf6m7oe/S8TE9Lf0ujYm
         6T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726432; x=1785331232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIMkbAY2u/8YcCwRUcpBFhYiOZxj0l75/x2ZVLsA0S0=;
        b=jlS8TaGdj3qZMIlusdjczfwkd70XpFB7UF5Wq4OQTanFY6BuSHnsiu5rt15oRkRUrX
         VQS7dzsUPJ6pC5YOtRs14YqiaRseUkfLP7nQqWZddFdGyJW07t7XwNPZT7BEo1jtrTU/
         CgBdoRJGxwjyDaPMDu2AbLwKqu+6LKZKwroFns0X1dvafesfnhwpRCZWZIF669x/byK+
         0T4Pp4o0jllahcQ14uBpfjJj8Lq5nRvgkaW7UVj6SWZAlbYliWj966xDDxkBK2nqXbkz
         GUHrRulzYI+tIN9haZSlrNXuOtQP7D5eV5KTagT5XxXyf8x3D+/WkNjY+STGG6YjkjfX
         zqXA==
X-Forwarded-Encrypted: i=1; AHgh+RpZZE2FB5UN/MnQzg3oAkQVmKnCIgJ2kf3tXNdsZIATt1C9t6EZMFwsP4VQSiypy7pT2+WML6U1NOsL@vger.kernel.org
X-Gm-Message-State: AOJu0YwyWaJZJu9Fs47RIo/TMRnUE6nA+EHG8AYol8bFerDWJI/mfTkF
	kt34/ym5HJRq0KysKVnHAHXWidjpLYpPn7zE1KZRnTfHbbnCGUzA4LfPG9LfY6Y1tlHpTdFjzXH
	m/+EwbP6Tk4rM4mF1PPBnLGwZSCE/d8eJRhHuZ1ISRaUsHad4Qc9PbdcUkFCNsBSs
X-Gm-Gg: AR+sD12vvuhTscwzcjQoPeCIZ6UeV5HcLTiHvuGctOXubGtlioycFqsnOVhXINDW2De
	RxHyalnA7lg4HeJQXwBr5zA47QAkA9Lf1+/70bEaDKHzvBIcsN7TaUfoyCAlCR3R2HiKyFC1cKo
	X1OMK+ZAy+ScywDtDlJ4kbrqeNM+WMagT3Tm60CE6BAiW0aio2kFgozKz6YGnrz9MCoime7zbxc
	SuIvwZEm2i2MpdRItouoeKwYLXJgv43PTX7x0SH4mqji9Od87mUQVwEpfssqZPOnLEmJprOTPj0
	UgMHCxhJo2/dvhnO8aV/2+pFJIsEQ6PDTUUBnta/UCrNBzHHVkpn8o7EghdOxIVcVtshUfsFnjs
	haX0KylD3Tl3EperBN8JIJZpRMeRjH5F7IipnkhDE6X3oGOrZceXSsw6bNn73OCCQpvERjaPBA7
	1Cm8ZW827oJe+MGA==
X-Received: by 2002:a05:6102:4490:b0:739:8c52:f2b with SMTP id ada2fe7eead31-747536d3ad7mr7088765137.18.1784726431986;
        Wed, 22 Jul 2026 06:20:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4490:b0:739:8c52:f2b with SMTP id ada2fe7eead31-747536d3ad7mr7088735137.18.1784726431425;
        Wed, 22 Jul 2026 06:20:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm4860331fa.10.2026.07.22.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:20:30 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:20:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <qf2qoy4re4pk6tjoyqohfcj5odlsccfj33rfqanljnmr3v4yaz@v44t2vujmhoy>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
 <20260720-monza-wireless-v5-8-69ec6743543c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-monza-wireless-v5-8-69ec6743543c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W4tyae8jLJ8fP7qxqsywTRieCucs82hq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9dPI7smloaxU
 DMlMy7YSd2CSt12zMnIx/Yi8Xagz2iepDrHaj7wJBCYbniPGpn/ZqOf2y71UDk72E2/IB2Pt3hB
 jXkOs+ecpeCSas/NMiU78T7gWFZV0NIIlNfDH0+YmTVLChVjlvADohQfvHtCRJw8pt1ASgrbfms
 TT1Q64ym/vSrxM5zfMyf/lthzsrnOm+kfgOxl3o7IwrDTAccb2ycblBg1X5AbLDrqs8Z2Hpiq7H
 D0RcbQFl6pF8mRhcvqG2qGaGTMCTKo5InUQSIjKdI4yDB2t5gi68YkeSpPmClDmXDDghKYFnFaw
 27F2EDsh9vZsXFFNtkdGzhtHsNw3u3rzFMFtUWbWnJVi1n1TeLe2yee4K9jLYrr5gPytHooqkGg
 20fuQDunZHJj1XukFuAf78V5sUH24mDWtkguDzsTONgUnsRNo+n5NqsWM/ec0D0lAtwmvud2XBr
 oCF3YVDYpYyy89CUhzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX6ORiTnXRsdQ8
 xL8JJu85Kyh0uh06QO4TbhHNaIT9iaYFyiorULm+yr8vVourghRBGSpvYxZp4EmmjCItc0WA49G
 oe/DsgYuAUvxfO8hCyK8hcI4fklOBQA=
X-Proofpoint-GUID: W4tyae8jLJ8fP7qxqsywTRieCucs82hq
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c3a1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=huXO1bx5tun3eLEzRFsA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 20, 2026 at 10:04:10AM +0200, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
> rather than a dedicated BT enable GPIO.
> 
> When the serdev controller has an OF graph (indicating it is connected to
> an M.2 connector), acquire the 'uart' pwrseq target from the connector's
> power sequencer and use it to control BT power instead of the bt-enable
> GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7e4cb03d3db0722e5f9fa2e7a5a9a0894bf4f18c..8496bd428602c48d093bc76f9810abb9b1c43cfa 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power.pwrseq)
> +			pwrseq_power_on(qcadev->bt_power.pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2387,6 +2390,34 @@ static int qca_init_regulators(struct qca_power *qca,
>  	return 0;
>  }
>  
> +static void qca_serdev_put_pwrseq(void *data)
> +{
> +	pwrseq_put(data);
> +}
> +
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +	struct pwrseq_desc *pwrseq;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
> +
> +	/* The pwrseq is looked up on the serdev controller (which holds the
> +	 * OF graph to the M.2 connector), but its lifetime must follow this
> +	 * serdev consumer device, not the controller. So acquire it with the
> +	 * non-devres pwrseq_get() and release it via a devres action bound to
> +	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
> +	 */
> +	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
> +	if (IS_ERR(pwrseq))
> +		return PTR_ERR(pwrseq);

We really need to add devm_pwrseq_get().


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
