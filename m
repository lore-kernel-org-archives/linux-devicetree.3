Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328D3A2E3F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337479; cv=none; b=Rcqma62J6cl+bCrNj9+y/uQPy2BswMcyJDMWxdN6NCl9I4MG4IfOgnHtlqb7pTku2Ssr7K1hQ42Kch0Rz7soxwGhijpUVhUfVBLQupqB9sD3qHV4Yk1SwHpn1wmsGQW4adSivg6CBqz/xRl0SVGSDWFkKq1aW/AG6+Xk6RSHoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337479; c=relaxed/simple;
	bh=USw1vEHEnGZ577Me1GPxccUL9xDu+6I1Z7yk0147Z8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIUoz5rPeXb5PC3Hy2ILbVSPaKUGPi5OqKxm5cMCxIQZS9P1XtKiaPDstK8JIN5VvJVNolMI/6L4M/x6eZfLRkqaIAylFPpWIy9Scao5vrHkNzQSLHXB0wEFIOQ9I3XQkZSJxy42M20uDbxSKhFDQgclkEbnm+v3Ey3HacObYS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=binH7OZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRE8VPsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="binH7OZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRE8VPsc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VY3g143080
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=; b=binH7OZjSuchccFh
	TQeSgoaZ082lvCimYr2/uz0AL8xWGNhoCbRPgif+gh0Rtd1sdPUtuNm3V6c111Ol
	lMsSr83w7FYMfRdu8S1mqr5v3t9quTnr9M9RX4CeXCtRejok91MeSO+qd+6ri+52
	/g/3DvinbHoWNBjr9gyeCRP4quke3x2ov3AhLqgzH4Q+QgBuaOePo1PLwoiZt6m6
	zYbUa88jESItg1CX27yfBdqakJEqRwdiFCgv3RGJTn7YPB1yg07ETa9YmOejKVgJ
	CsFQFXOqWLu3nYGnTSRq5b9nYJkqCZqnpXNcYbCo7TmPIhVZjilWTROZtO31hPQQ
	biPmKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397ay36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:24:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso11688985a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337476; x=1788942276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=bRE8VPscJdxY87PsgukSi1mSn2YJGcLPTQGRFnTer66K66K5vQTdE4nwCGab812yJg
         kOb7kRtFpzB5XJtInpFiydmOZeRJjUKY8UbO2gMMAEvDuhHhblwuTDvyigvf757VVfm+
         zqYnGvVfucWLNw1WOgkZIlzMxHup+bn3Z7cvwJun1fah97QBAvWGStXPGivH8Ifmnfpy
         zw4sb4/JxdBTpHUjM2xbZuEsgUUSZeXQx1S2C+ylQucY1zuvYTFN+W+zXVcDdJSMbOff
         OZR5CdbZ2SW8jR6P/l/r0VF4oWAr9APqisE/VQ+FR/PkSdUWl6ssyd/GOvsydbCZvv0a
         NhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337476; x=1788942276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=DcOt75IR7+1kIg2HcuXjd6E48Y5sG9xN6U3CiiNJOqcfoqGHzSxDKbY/j/WYvZS6st
         ESuXgrGtJ7X/FAMAZuGb2m4uigyVp/Asw9CGBW9SbWeYTKpByyO0ghF4hUeWufF1h7aC
         keJeIRKu1Z2+vffXtJ3sVmQ5BiAcCa6qhkeIbcKI6/9eFLsZR94r0ztXJ31vah9A2yzA
         LoKmqDtQMbjFbVFGUtYilbZyHCoU0zrENpMLISHwfRQP0peHqHeyozrJROSq1YbgnDOj
         oYH477fj1R6Ax5alxx9EceDONHSKxO+NZfxnz9Lz42wvcM9d63Zhcs52iLKPJtJkS4MX
         fGyA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/uohQw8Fg1q2f5jOoOzDpeUKVVlNLA1iFOF8v2IoBefxKTLxLJ7w9ShJji/a+vHecPbI1FKOVJSko@vger.kernel.org
X-Gm-Message-State: AFuF++lu/p6IRHLcdHMLSGkW0xSEFu+BcDIeIC2CjDGbVweGKaOGbwOZ
	hm8tKPgUkqFbOpqGvyXM6Zy7rNyXVZ38CLaopJsZqXUfYmhK7FOyKsRqEJsr4D3GJqisKe5CsSj
	VuOPoRYXf+zz7lkW4ffzH5g/uqJ3GamFltGvvU4nGTrU0pAtqwDHnGb3/VhZcWdmU
X-Gm-Gg: AYBFou03Y2O8lXfughFK1ICkB536/zlLnIGtQL3E0v2SF2od/cC9qXbqadjb/AhQ2Uq
	lrCkqHO6jtsFTf7rL+LCGqFrRMAXFno0uYPy6qwBZkoDQqxz0ORnWU5gpMJ+sEPy99F4YhIGJEt
	hwlR1esASoxmAkLPn1VUIRieg3Nl3BtTMAJAAav9gS77/1Vr1B/fz93i2Q+XH6IsG+Q/ZqZA/QC
	I+fKn/rqFexpXcbPBKdyFv07BL1cBUvIUW9CD5ppGZb/u0tGa8PjT/kDa9/AJN0hhipEEre7i9S
	3SLA/nBnThSmvL4C2ITbGQ/v51Oq9p+foNrilsquyyxaJy/qyqSL8eX+mclzOTXDOygK3OWaejL
	7S/GdD6QiKt1YUpK44iY01Q==
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205867785a.0.1788337475863;
        Wed, 02 Sep 2026 01:24:35 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205842885a.0.1788337470667;
        Wed, 02 Sep 2026 01:24:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002e542sm89009966b.14.2026.09.02.01.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:24:29 -0700 (PDT)
Message-ID: <e9a0a9af-defd-4894-bb3b-e6e19ba3370a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:24:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] usb: typec: mux: ps883x: add a delay after writing
 config regs
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX768TlHR9dwem
 dptw1FhMwLTdRwRDumRvS8J3KIWQgXRj8yBEu33zRmbc+fCiGlnttm/ongGueeomCSM1VZTDbD6
 XSI9VPR179NQxOvPJFVD9Wx2Y1dyiWbK2PRxeiYXs6SCvgHEhYyxBv5Q2oaasAzSwLdO68Widcm
 dz/HjfrvpWtYEy6cZL8t18E8MQph+YBWXTrUwNWi8LS5NIRb5Oi4wXOzXltd22B4HnYjmvCxyk/
 z43srzozktKD+aWNgpxzX1iAqe78AJls6k56piidIe+XBOeySJWouZsJQoKBAIxyUgLrv+5NYZT
 pKGLx2BwCI9/mdvCznIWOMyzX/X22y1qIgHofI7cw7EGBJ0Bd5/OorYaDPWPlrrb528Mj3CBUVH
 pqE9uWiXUZ5Afdw3n6BTCcuzXTyUzuMwsyM652Y2Wgy69pks6KwGvQ37ecvch+S5uXQMT0wYaI8
 TVpkBKDlEKYB2RUqIzQ==
X-Proofpoint-GUID: 0U671v1GtjmyVjoxl1TnNSVVA-bUyLJN
X-Proofpoint-ORIG-GUID: 0U671v1GtjmyVjoxl1TnNSVVA-bUyLJN
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97dd44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=vq9KN19LKcxqXYNRiqoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfXyx4DkI6+Hz/e
 e6SYoeC83wIfockjB8GytYDWLV9HqOOH71llhaoWXRzp0YQHDLKfaPRIMIZsxy5nRP/PSF9gXrf
 tyX/linFdbEU39Y/HJIaUtFt5sauLsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020073

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The config regs seem to need a few ms to propagate the changes through the
> system (like, PLLs). This improves the hotplug dp altmode success rate
> on the Lenovo 40B0 dock to 100%.
> 
> Tested with T14s G6 and 40B0 dock on the HDMI port with a type-c host cable.
> 
> Assisted-by: Gemini:3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 3533d4f363286..3ca2952e6a0a3 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -185,6 +185,8 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  		return ret;
>  	}
>  
> +	usleep_range(20000, 30000);

I learned our firmware (which drives the retimer on Glymur, instead of
the OS) does that as well.

With Heikki's comment addresed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
