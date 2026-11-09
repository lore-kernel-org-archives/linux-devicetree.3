Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222473;
	b=htM/nT2j/pxqxMUkvzZxAnLy1PI0zz/pnxa48zAIFtv31NT3kRBzLoQ9x9CeG+tOI+wX
	 ZXxw2ILsy6SH1FtZzszl9ocmXdXPRVKDaj8P8XqaRtAsdHkxgTeyrBEuL+2ojJmrCDO5B
	 o0XS6pDD54jbSFETG3JCPotOOdvnOOQe143lkd7YV4/kG2XgPxye9UfJyrcd9rp/4LBMW
	 ZhOWHvZJ+zks8qA07y62W/M9f9qj/tn26jp6/DWzXepb9BYpxpNgpKdPbQprmhGkaECM8
	 ti6xmpwqKOUaVrzhI2pHzEWiLgmyBemlMq7Uj6YWMFuG5CbiMUs7N/bCMQ7xHrNb0Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
	b=n/71UPGZLvsrAMmhiy6WK1Zv+Dfs1h86zIBqq78/VePMuwHlBMjTFzw2+xWSSj8CnDk4
	 jpi3nu9a5FnJLVsa2gnq1q4Mf0Ya8k4zTfYdfcoH7gFd7+HuVMLjroViMUt92WSx5KduE
	 gbsEfLz4O94EZs+oRqrce+3XUiUyA1vrVaZWrCUQcIms07BCNlIXSd9YPeUqrwU2WaNSo
	 j0paWt7PG66f0kyAKxw2baglhDVsmhaegzv7uuKGBkRGMLZT3+Z0OXyIP0OKdqcrpXa+r
	 ry/ZK6N6vtGIBK7McW7XUr2xHnnOJj/jmiigmJVkyddr3uUnyDjK3jTugrmsvvgyIdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1E606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uidj3600417
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 11:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1TZas2nUn4Iyhi9A5CEWWZl
	SF+cg7JudGhxYTHfccQ=; b=imtvoHwe1TePJNqu7ofU5s7Z+PeuiQMjH7T+T6Eg
	7KuU4BNkH+mMEByIzdcoBf+b07G7+oodUIg8HscksUnb88yKzQ5KSvd5UPp0PEhI
	X5+Z2DrTnF+gy6xx/STu/TTTiUYbNNtV2pcxfuxObjRqpdbVZXgkHZgMTRbYk1PE
	JD337eqeHe5vl2u5ULAo5bpP0zGtvDZanQf5BFrRRypA/k3xaU/vBwqXLzV1je4w
	cpGfF2ujU2opvksfN8+bP+6RAsTHO5HdDQ7ri8XQXCrekzGWRyN3WHkFWBrlx7z8
	ZayvXzg89jFRfBrzafleEQcpSnq3MZ2Ohvm/0sf7BlnfDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588q3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:07:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so616815137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222471; x=1794827271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=EDBoLGJbXKlwqaS8YkqHtf8UCv0iuglQip6x3YrR7AvwU8STF+IaysKCH1ULJGvA/O
         0/pTPE4VQ0hx4xl57SawpeeurSttsw3Eao72r5quJnVLAFc8l2Zap8VYY8LQl/F9FEM1
         u86D8qPJcWb1S2XY09r+NquH65wAaF9Z/psJ2MMs9qZadm6BatGkKKhc+pYBb9EWdyF3
         Rhk3r5MrH8NQzhhIGVA2vbnWvsLI/SNySc1JzFEjFFragvtWrvr5Nk/SW0IOO/8RGPJm
         WPfw8OwD2S0FX71FphluFcK6eObm0iOLjmxfShu6DZc+6qVQsyDA3rTIy/oTv+7UzATW
         IAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222471; x=1794827271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=f0hQ9KYNU/hVtANZMJ8vJJ6+5x95dVyD7E89Ke8/NLHgVFKbP7JuY5TkQgFCEjNCqv
         ptSo/ZhdXcJnw1YPxzMPDyN3t8tj1JEAs/7nPp40engxEY2JLVD6cPB5dALxdP8XOvEU
         iKezuwLkpC+lmnPXuIvYJWiJZrxTdfkrBoSzPxpHzuQwUzUGB/pjaBwfzHmGBpYburww
         n7ZDftOBayi0/5ExlPlgXo7nrKNii4yZTOQkLUsSwJZkv7N2fUuqQDs4eDgoUZ8xS9lE
         pIYa8Hyd/nc4bzxzZxN2E93F7+PBp4uUvOSY91buY9teJwqXs2NCDv4I4hSTsbETLbOf
         BPTA==
X-Forwarded-Encrypted: i=1; AL+hErGkF9HhcHpbUfTu4szjSAYoA66ds7qcID9/TWZ4HQkfEB/21SFWzorx30tdhhgkAlGVnYADGN85c95u@vger.kernel.org
X-Gm-Message-State: APuU4Z8TB4Zaf7UPKsgy5kUmUzQffS+8A0AzdHF7ZbudbZu0sHeMZeMi
	FNrPOmyB5yb7v0OwwEzzTW75l5EmZ+uL+vPl3pp6irZo+EGUMduSgGMDHiQ9exjTOe5005GlVVl
	lXOMVH56ImrmpVmhABR1BQsLzTMh/itTLMmh5UxzWnUwxFboXgJr81aOoz98UdT/u
X-Gm-Gg: AYBFou1vbgl4GsVpwx4/ZZIE6+XslEPIzVxNk8JZFx6MN1F+3Pt64YuGRdMRocE0aMJ
	F9r760UgrmY8yw7npwE71Bp06xFIz/Z4nOCBuT26aF8BJrjRLFyQfQyZprCsw/l7PPEEUZT8pNd
	IB6ETEe/YpiyVsOzNlwYwAxr3E9RxRke4gqo1hqjCXuELh5ZqDEvYylLK7xxTfFOosSnOtKf9Z3
	y+sTMDt8YcbqZCmsTroOSp8VcC3czDbRAGj91HY9mYjybtAlkH2HFlSNDqNnplhw/4+CFmJWwKB
	NTyoWQXB+gmoYL2MXca0STYNe5vPHB+OCg3osvyb7Wt9xeLKDvz+Xvq8QKrPmFgQy1qg0WfRs+c
	sLPmge78fRXaeyCCEguXF1M2J9z0nkWKOXBMVZSZV8Lz1Pt4WQj8ncps7csumyBU=
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076598137.2.1794222470994;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076584137.2.1794222470405;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7740628f8f.2.2026.11.09.03.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:07:48 -0800 (PST)
Date: Mon, 9 Nov 2026 13:07:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
Message-ID: <adkqpnhp3gcxjdot4yratxmnvi3mmkyovbusff5ypl46cqlw42@cd6on7mzjmwk>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
 <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX8pGCZ5XHFUgs
 4u4NDsZ+Zb6gnYzSFLhgSvWozCCgG05Wj5MVm5bK3yjHpYzKNodCGyyaPg+e3egOfnLyLtIlDax
 +zHkSpN3KVL9fhIg4/0tOuWQLf2ucqjv3i+Cg7pXRZlTUZ83LG8+XOJYTP5woIou11NpPMsKRiD
 26nRehWYk4k0QxtKyOIwZYvmMoMsOntvYRwmh1gzda+95Wr28Ew45FDyPch6Tqbzq+MzQwMyRyc
 mkB2ty5N6xgDA6OroSmbBsiUYWtDCZvtiG7v3EOCaFCa7aXtSZBxx+g8wV11tY9xRJpvL59fHKP
 ohnorH/j5BWk57zYI4z73lBJZiuDHSwpRjYTY9d75T83xtOP9+uez5v51pHMGsPTqy5z5/iN6rw
 TE18L2kLL6t0eYY3FLbuOEBxiogBJRperqVcslN5mrJGG/8fNlzWeKhpk+JzJHmFqHzoNN5cRd4
 j5EBdcPoCKcZB+4rD8w==
X-Proofpoint-ORIG-GUID: WsxQ42Gg-Udm5r6Hb85LOHoqzdzGf9qI
X-Proofpoint-GUID: WsxQ42Gg-Udm5r6Hb85LOHoqzdzGf9qI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX+q31Cplbfyry
 4HZ7t7gEqUkbMqEx+piXSojmuppd/Mlh8HTZ6HH9myyMSGElf53tIfan8gA0S0xxPhLw9pkl8uF
 AxllXIkC8rFeg43k3gq6loXZYfgWh0s=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1a988 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FPO0yo-LnFrNtlzATzEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 26-11-09 11:19:46, Konrad Dybcio wrote:
> On 11/6/26 11:01 PM, Abel Vesa wrote:
> > The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> > i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> > Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> > GPIO 66, as on the Gen 6, but the firmware describes it as edge
> > triggered, active low. Using a level trigger makes the handler fire
> > continuously while the EC holds the line low, with no event pending.
> > 
> > This provides the EC hotkeys, LEDs and keyboard backlight.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  &lpass_vamacro {
> >  	pinctrl-0 = <&dmic01_default>;
> >  	pinctrl-names = "default";
> > @@ -987,6 +1005,12 @@ &tlmm {
> >  			       <44 4>,  /* TPM */
> >  			       <139 1>; /* TZ trigger */
> >  
> > +	ec_int_n_default: ec-int-n-state {
> > +		pins = "gpio66";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> 
> nit: please keep these sorted by pin #

Yep, will fix in v2.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
