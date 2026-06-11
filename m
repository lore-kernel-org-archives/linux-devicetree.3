Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92AD3D5C0C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179775; cv=none; b=GR+0yWOLJ7pypw4im7R9iOyBTgJirorbImnKiKqxRvF1WPZBhqN39eWSHI6w1MNO/kLEAmeCUBHNr8hBZa42dngAqF9A2RwpPPOfu1lqWyFoxW61297o9WkhUMw00qHuvs6pb3f3KRLR2L89FJfWOqB6RiO7fE9yUyyzgmHm1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179775; c=relaxed/simple;
	bh=PvuQ0Mdk6NxDmi0CVM4MzXjDM2sWs1KzMrzzbVZ/HAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sW8feVrqYb76jcS6wK7NZB/1HBF9q85OXQhiM+vsHIVxhi2GdnKdUGLrbHCekF54rYVQIHkt9/N1u01uW8Y2MKe6TkEybkaUOPda7aCJ2onebh3d8Jte0Y3JNXzDHaE3ZGVPQrwPB0h9/1QsEn4GJUaEnIzjZglebxdIfLHAu5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX+52gJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1QFzKHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX+52gJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1QFzKHO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA04bB318925
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=; b=fX+52gJamw398GVK
	gyubigFeKdi3+9/GX+7kBBj6HY42+3HdRKhPsu9mXy5dbUXS90EJqjsSHDC3G8CC
	ujFt7Rt0wqppB+I402QBxcq3vY6l3hU4eZmp4tlXDqXI3o46pazyIElutRHRxWLJ
	aEgj3/0kX0o5BsLwO/PzMC5X2dBUcJhBZI3XcbFvhnMqDvi5OELS82WE6F5sH6hI
	hYNgSUlZlUqqSTneeKkl00PR+tpsBSZNrbtsjmaeyjjYMC7MqNVdmDXHOXFSbqgD
	///S7kA36MeheAERQvf+Mhsvk4jn96lMD7qFNpb2p9Ce9BLpMN2HwqV1Y3COO66A
	0wy0GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skbax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:09:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51759082206so23472031cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179772; x=1781784572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=;
        b=G1QFzKHO+FbmtnEAl3cgJ0RO5AAC8b4riE04qiEmvuCy5IpV7zXK0ZRH1B6XG7pW9p
         9nguGU+sAwb6S6Y++D77HeQ1TX9QZQ9l325y4Q8dw+gg76TVEnKku4csMaVGGbGLWG3z
         f9RVhD7CHTy3UmgVnhfR9uwru76L8d7IGXM/6uvKB8CvsUZOn1h1KWX4v42fKyXD/hja
         XWXpj48cVsJfpQBx4sSbQ4HGcyWAV6cJoYb3QRHYBJ3dAR7fIlih4CNZiZkF69hBgqZH
         m7r3SyqbdKwN28l7gQDNfP6vWl71VvQccVcMGjOuxrOfMRJE/HSI9pWkvHGxDYt50sBP
         s4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179772; x=1781784572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=;
        b=DwHdtkI5BnI/zKUt+3DJYwlXoMlNKqq9AYUSy3d2pMeH/X2Gum/bt/qjjuI19XLDsJ
         K8Vg9A2vUcr0JoEi5fNBdW2p3wjOvPouJzfzE6rgAANL8yQn9GR6qHtweNzPK+CN4QIM
         zVC+cT8Xt93tLrRFDT7yM8gFpDWTX6PXtEJEbc3Z2rtogDwizrBMY9mLq6W1EWFCf3Cf
         4CMtYH6pzCxWmDnAErxfaVE7iUByXDPV7KLH85cJpouYXrBBU2kzL8WsZvu+vvuiRbZo
         G+KuSq7zQF/cla4ib02YjfLpdzl2OluzpPRacBg/dgZpyGgxiPUSAmmVHzPTRod3zpFu
         8QWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8j/sy4dAQP0CPl380BvSbf4ZMT9Eo9LS+CMlT3//qW7txlHgIBZicaxI7bEpse3x5eJU+r5VcDV1Om@vger.kernel.org
X-Gm-Message-State: AOJu0YzPb4/TgtcR/fS5MQ9nStZO2PWoWJ8Kw5idrQwTO+pv38VKnH3d
	p2r1JYnQ2EofBHuxo1bszsEqbxVZ5uRrpPlnBkJF3d4q5KtKHLHCouXlOCPGMDtdUuLVCrttaPw
	Du7DYl8kTGWQYKnEOY8A0XCReguWkKEZkfPjt3wIoJ84C0H+BMk1cPg5PsumK3yD7
X-Gm-Gg: Acq92OFu+STdKQEct9z5JW3rqUynwfY5iXnywx+PHwVJXRQUyUNO096vs+d/TarBQq1
	VwsAOxywisaOMxkABA0UQgVV+fDyWzPYIfG8B/ivsMkNuySADPVl2mqiO/yYn44qSQmcoMOKr+z
	Z3Iw8A8JTHM0hm3qCQhPvRZXmqaWjx0hph/zZSrTvl7mEqH423BHhAV8VSWIR3lSK1x8lyKWNEI
	kerMtHmbc1mUNVm1wiBl3ZMB5jsDY5KdqTUuliZ4mLolxr6cUVB3QtXRWCUpRINxMYI5awBlSCS
	+oRBygWUzgv+TXzWok9YW+HDZ1C4rDDiD4T24BtYllLWzQTskzhe/s2gTjZ9KgfOubH53OPB7SQ
	jIEqCUjwrWpXxq/NCKNOUSYCITOe3XSkLF7M0e0ikg7xSBPZWlqooZ97K
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr23989181cf.7.1781179771938;
        Thu, 11 Jun 2026 05:09:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr23988691cf.7.1781179771522;
        Thu, 11 Jun 2026 05:09:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60ae379sm56540366b.50.2026.06.11.05.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:09:30 -0700 (PDT)
Message-ID: <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:09:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iQf_ntv5jFd4cL7EqhRo5y5pDR4atxQo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfXwcZyXnR9RIGI
 uT5Gf2EJF6EHFWDKQirMBVK5vIsv8vynhAiS+gqtqkuxPG+EbKYW1tFVyaP+ZmWC3HxsZFJIgQ0
 1Gir2yAS41i+5i9JkK2xfmyLYSh+nFE=
X-Proofpoint-ORIG-GUID: iQf_ntv5jFd4cL7EqhRo5y5pDR4atxQo
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2aa57c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VQxyErZXnhhA2ehoMNgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfXwDGphGorLamt
 f6tJLkS4T/0Sg6YDo+2H2BUOgTWPN4XpnsixtVOjzMSF/AxWffjz+6SozPqj+ID0JqplCrwpbsh
 mDlK71WNN42P86q/x7IWPeOn4GR3Wql6b6xPwXNraeB/JCNCaxlLL5XMtE5xaZlBpqO+68/fVfn
 Sy9yMZeSwNTWMopSOjUrQcQeJV5/YdVyo0ZcPYNAwT2kAHKw5eJMU+DxQLIhGM8+UCg7qQvgS2d
 d0TT5pwLnpg/yD5/5eofx8AB8eMbb+RtMrrpoD6MMRYOv4QWGamRHFNCJafswSDO9C7K2qHagFz
 X1jkctbhDFJgQXYKrtTxXCyOTZsr+rnjFDDivFNG+UadRD15BUSULzWIuWqCfzciRdPO9rN54zr
 swr6lpBI959Y/BONKaViDRZuD3tX0bAuNBlzV/6JIGH7sa9XlpMFPWmqNrY/nVpjIaglpqUsQPL
 0D8hRzdeFp4EHRFCvoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110122

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> parts of the device.

[...]

> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_s10b_1p8>;
> +		vddaon-supply = <&vreg_s11b_0p95>;
> +		vddpmu-supply = <&vreg_s11b_0p95>;
> +		vddpmumx-supply = <&vreg_s2e_0p85>;
> +		vddpmucx-supply = <&vreg_s11b_0p95>;
> +		vddrfa0p95-supply = <&vreg_s11b_0p95>;
> +		vddrfa1p3-supply = <&vreg_s12b_1p25>;
> +		vddrfa1p9-supply = <&vreg_s1c_1p86>;
> +		vddpcie1p3-supply = <&vreg_s12b_1p25>;
> +		vddpcie1p9-supply = <&vreg_s1c_1p86>;

[...]

> @@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
>  			regulator-name = "vreg_l7e_2p8";
>  			regulator-min-microvolt = <2800000>;
>  			regulator-max-microvolt = <2800000>;
> +
> +			/*
> +			 * This is used by the RF front-end for which there is
> +			 * no way to represent it in DT (yet?).
> +			 */
> +			regulator-boot-on;
> +			regulator-always-on;

msm-5.4 maps this to bt-vdd-asd-supply (asd being a keyboard smash,
perhaps?) - what is its actual use?

Konrad
