Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C37372EC0
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785736; cv=none; b=B+BPAaKeYMt9w0cPf2FnLIjUKt/uuV7lGiI/JNz/CKXdBNJYAr41Pdb7PiaUBPNtA5PeDJTADKMr97qEvHAy2V1z2xBSLvS/NDxevdIpeMl6BN9XPqJyFv0Tdhu821Kbz3DUyvaSofywwYjBCYr4n8IyQBT9hdUOYStYeJXaUfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785736; c=relaxed/simple;
	bh=f5KtYKaGJIxJIH6az8ZfzoSlLeMtkQY1lpV+rUwL+KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/dQhhxRJhI6LxeL2QWWYvYa1ckBUWnMgr88gwM0TaCBRX58auDKZUYJdas4xVUNtSth3/2aHS4A9u7qFX2FBKHLEhSE4H1xoKu277Kx0prmEfsqR6NFpSiGNXK64firBSYxKdXRaS3pMtWyJSakxY6dDkG1oII7ViFyRYk5w2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YV7HYVYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOy8k96w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YV7HYVYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOy8k96w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2pNac3658354
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=; b=YV7HYVYNNxtmRNDt
	fqLX21zOLn9xr6KdWdFRx7xpanAs3FfIPeMi8WBSnozd67JKodgAIPDUZ5LOqfJQ
	1qlBS5MN+esEN1hguBnApfVoxbLIG2YpuzLkr8/G6mFB3Or1lwaQw6BVXlsTwhUQ
	B7ti7z7zj+wx4heoDd+wmtr3x3dP10ozxXCmRO8WS9YGtB2zbi/MKQrFOk/bxtMs
	wmqoaOFMUFXx5PLmTUG9Fs2NZx66HM5oVHOmPl4L26QYdRMlDdR0t8RP2Bhf2Xc5
	3PEBgYohLB4ItwmG18UKouY9MOhv0IjtKxEAmHooCn2UY+Vcag//c9RXLN3tblD/
	TG5cxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynayuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:55:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516eaf9fb76so46983271cf.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779785733; x=1780390533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=;
        b=kOy8k96wAYKMw1oN78aAhVP8QRYK6ICVv/KydJcvFs2PMnxSWFN2EiLery05mqqDyu
         mV8CnkqzQFF6g928HcU2EIgRxFCHyTpXLid+bz3WEkn/1gxOfteBBmiejoRXK72lo3E4
         OrD2HDCdIpqCxNKtIhQwvjNbCiHucCuNZjHN7cv7yI4hC9bttwgs+OKQfx7yTNR91qfg
         2dp+qoK9PAJzjt/hxcTLdPNguwIw2OnUvmyV4qtTfpC53JfdQck3cP7denSeZVvmp8EG
         NWaj7b64GZZVLp9cAliSeHf/7Idb2hr4YfMsMYAhJosmCvYK6cRCSpwKKCMhZ0CkdnxN
         vBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785733; x=1780390533;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW+9suIyqVCiJGP9No19FKzkPfU8OlRbEUkWKfC9f+4=;
        b=srb0mg//JCBDHx6u+wJBeC6ul3hW6ru+KulK3MzlZTBoVtnytnjkCw926NG8iflnTo
         NsZAMwr5K5mpPDMJguWnro+hT3PirwoJ1FMvjGYHvCub4F87YCNqfx/FFT113lh5nPaX
         IievBZUD+AHme61OLe+1kLs286dtv6vpxmcoLVve0nlznicFVu526t9hZ3HGOAOG7VEY
         nuSmcDuX5ZL5Thf+4dfqATL//QkULD/c88fnGSovgj34M0gGGBycjve9r066cLll7kcr
         zQoGwLnzfVxXnujP9gwpTWzVWp/wo0TNH8VYVR+uAHlttecEnqh1C6aDVHm+Vn5EIu2C
         QNSA==
X-Forwarded-Encrypted: i=1; AFNElJ93bXrUnTpR3OgtrpnGLDOnBXVyYJ6F7PB0nYu7NO9TMCA88TNpzUbp9A4lh+jj8/tClA2n2eBqR1zE@vger.kernel.org
X-Gm-Message-State: AOJu0YxzN+UumXPk0+pqelly9yLekhR2z9FXoCg0Of1rDWmQs/rUFWqd
	4TXbjEc6ARCZ9RnLpevmFxlvAy1GupF1aOX3Q44MQAaH1Ifuya+oUU0+qO/ove1yx9YXkZtcJ88
	0Nq34/NZp+HZDkLWoA+mOCYrEN/p21kl7o+j94aIPzBINxYkO3LTiwYw3Zcbpr5A2
X-Gm-Gg: Acq92OG1KrAx/846mFWZBYgNnPGEhdYKXV7+tPOsjsEWGpfqkkg1IMCBqolqxKisSRS
	JoRdGt28oIjHzWznZzac729ffbJoMJq21szv5zp146I6UqAc6JaMgrcn84DnY3SDt2DUQNDetum
	dtnIXY/TuNGMHFPKyN81gNTYfJRk/ojFWii3PDr8Z8C0KRPYrPWkI3rdQkFW5kM2fLdASX3bJqT
	OCPmehXPO0zf7w4yCF+Z2RNOTpSjo9krVQu+1zTn5PaL5WMrb7vAHlipcpy7kkr7srl6cGgh8X9
	HK4zSq03ElDDVwkzzJy4C7KYXAFnreL3KyoRmeAFgA0mCy/SMtCSd1x/+7fuaoXqt8KNdx9CMJ5
	xRTHa46bgY59e/ysaDBCgz2cq70KHuvs+Bhswk6VGeecRt328T+QS6BVBmYqf6JBPa1BH8ULgSd
	OfQr0BRVWh4INnjFzrgIzjNVtjf7BonRp5uKHr8m+QzDsoorE2sqE23bL7+Cly6Hda1SCmz1UEc
	Y4dSsMbbFRI2jIW
X-Received: by 2002:a05:622a:4e89:b0:516:d66e:7b1d with SMTP id d75a77b69052e-516d66ec014mr228482801cf.27.1779785732760;
        Tue, 26 May 2026 01:55:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4e89:b0:516:d66e:7b1d with SMTP id d75a77b69052e-516d66ec014mr228482591cf.27.1779785732340;
        Tue, 26 May 2026 01:55:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm478681466b.44.2026.05.26.01.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:55:31 -0700 (PDT)
Message-ID: <82a96d57-94fc-470a-b7eb-f0fde0c0dad6@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:55:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
 <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a156005 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DlE_u-NSBxGluEoo6gkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JOvMYHfxdzaNc11aMcDNO0VAlMrajxzp
X-Proofpoint-ORIG-GUID: JOvMYHfxdzaNc11aMcDNO0VAlMrajxzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3NyBTYWx0ZWRfX62YF69ftl4ba
 Qz41DdAP9NhcUUZ85mVUtDbQmS/WxnzizJl6ldh5BOMlkz7MRYmvWB4+Z7wYziVvUNq2D4kiiVc
 FQkTjWRK6IGy/c4fv1SIoAlhoKFf+c3/kUrppLSBfl+lxVloGz3ugKnOmgPO3yMU2YpHWxV3cxo
 GaPzXGIvq22MBAcW2PUoIYFXzDHjal6iW0unloOF1G+VFR40p3E/9mDeIEm3e0mwjqQ1FZBkidx
 r69ZyZ3DTNfRTfmnWp+/SglxmoQwN06SLouWWa3DSsCQVMfM/uWCBXcyeYtu7hBCJ9sfs8tg+jG
 FXnj6bcRaMVfFc2LmJNT0Fdm48tCafW8X8L+AMYbYOajx+FREZn1sF61It02lTp0MzE9gI1mkD+
 AwBLw/0M5WblJBEkg/C7SyWrNuPldJO+cJuvwMutUNEg52BxhVYgU3aG9ldFMd2YqvaeKqnOUt+
 QnRvf36gWeZyCQOyWig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260077

Hi,

On 22-May-26 21:55, Pradyot Kumar Nayak wrote:
> Document reset-gpios property for devices that explicitly require
> the reset line to be de-asserted during power up.
> 
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> index 138caad96a29..fe0ec4fce673 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> @@ -50,6 +50,10 @@ properties:
>      description: Time required by the device after enabling its regulators
>        or powering it on, before it is ready for communication.
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO line used to reset the device.
> +

For I2C HID devices which need a reset, we typically also
need reset timings, trying to do I2C transfers to the device directly
after the reset has been de-asserted typically will not work and
some touchscreen-model specific delay is necessary.

So far in the DT world this has been handled by touchscreen
vendor specific bindings:

Documentation/devicetree/bindings/input/elan,ekth6915.yaml
Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml

Which are all 3 handled by:

drivers/hid/i2c-hid/i2c-hid-of-elan.c

Which has per compatible match-data with the reset timings.

You should probably extend drivers/hid/i2c-hid/i2c-hid-of-elan.c
with support for the CRD touchscreen and either add a new
compatible to one of the existing 3 bindings; or if the touchscreen
controller IC is from a vendor without a binding yet maybe add
a new bindings file?

There also is:

Documentation/devicetree/bindings/input/goodix,gt7375p.yaml

which is handled by:

drivers/hid/i2c-hid/i2c-hid-of-goodix.c

and is special in its own way.

Regards,

Hans


