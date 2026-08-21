Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB241379F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294091; cv=none; b=Fmzl9TeEne6UFWdtuJdUge1WYTCiiYqxGQEIaPNX4j4kR/qDOcTVtywEEu+0tzonjqNrYzzN95MMGwPn+Gv9nciOIFuyKPCnacHJA0fpUqXEuyBXSSxxwrxePsNOB5nmGVvBb9XuDoJajHxvKcxI3RrUjq4fhCBZ/MmK8lBbfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294091; c=relaxed/simple;
	bh=PTtUw1aBvRTFrGS1Xdi2jShMywNyldzKbSOrkVj0R4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QexWgP/JyjYrVOdHEIFjIuJJtR/yL21p8G/61PtUlGkqyMJvsNF02Z/8Hq1mNfmJlqohCbt/VT+QqDUfmY82vMGqG8A+0cFAZwdUNiE8D3KVe7m26j750HZ4Vklazfhg9uxjaxtLED3bCa/ssqNLqcbBmjXYacj9/1yKsalkqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQHdeUfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFEOiXPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQHdeUfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFEOiXPG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TucN1271204
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=; b=nQHdeUfNpfGoXYbl
	CuPMJxh5IbaCOsFc+b7yKMoptq0NuV4RYrVCoAgKFXLjFXtclSJaUJv9YSje/87y
	GK+LM6Xb/9gN22/DnHr9VEjbDnHgfPTXFQelXsWp1QsA4cNgtA3J6D/ijvxGxMfx
	9ntHvSVAC+oAWobXWtSS2iC/QyD1Z9iBHv8VVN1oEGwkgJD1waWLY3wHw/G0L4jn
	dwBa5MoJWRlbdVh+gRu4WZxFGpJQsp2AjYdl8lQqC9Q/8wFL+/Htl4n9OzCzk3U+
	ttSi6ImAZcN04AuOyzd+cWvp4m/4fESHFSAr+kd9HdfCGQ8kVYzVXWFpVU6AnFry
	zPqvLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb8kkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:34:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so791549a91.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294088; x=1787898888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=gFEOiXPGVw06yPr1CxHUuP1Yuh8OkEVmiCzoURIymDPQH3SHXbJ7LabEcCsYe8CfxI
         T7J+MlPo5vbwhejcq1uJ0eYzK8QfpalPy6HV3uUAEuu8Han4K0g7y0sgpENHjk4VMlQR
         RMv2XsRG1HmKDNGKf/D7NK23E26+/BW72uS2l9BhCbnY3CvoQdrgc483/x8vv8yBl0Tc
         CK7n4uSstFbLAaQpq23S/a8Os+IknLQT9ynY0vCEhreiZgrcTNhsD3h6zEdU/a/6xrtd
         CzNiPpUwi/zmcmcuHcJMjsGQquawDo8HHIFFalJ7sMDviEYC2+l6z43EgfgP6KG6/yof
         IgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294088; x=1787898888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJSg8p95MkrIIUpW6qDHyz2rAmYHMQ1fjNNioDnnJ+s=;
        b=SJhaMTUxCJQXDMsED0+/9EvFY17VmWGPV+wPvtZS5J3blK9gP/Mkgyl9SDBlEP/0Mb
         iAFQc1tsMiHRCWzr8hxemNtSJsPJqpqggT2g3HK4o5t61Ip0Twz690fBiEkUpZQHvOyk
         I2u/FHHbF/GWQi2UeYx7ALvdW6E04Oeoe/rN5McfH7i1/20EJp22Q9Y2FXlmUn5gVgga
         BfG62Y9oqUZ+odmVRcPM7Sn98okMWaEHT36luLr6bOLabLkqMwcfk6ydslJ29VyAUX/b
         RXUR2XuOWOWFSxintKXAJ5mQGT5+wR1RW3abdg9F/Uzq/DXkx8rNidXB4enBxXeRqxB4
         U5ag==
X-Forwarded-Encrypted: i=1; AHgh+RpyYV6LyNSQRi9VXTDUpfHvNzKBnYd17mc85c8zCpmkRgvp37EbivABnDYlSnbgYiv77HXI3yHKfEnQ@vger.kernel.org
X-Gm-Message-State: AFuF++mY4Z5/FcdUZsGpoTm+u6vgKzUqRe5bMtJ3gVE7iIO5EjNpzksb
	HlQjzJTjrBLDQ3GqjjQ7xDdxeekPNewr0YY6b55SLSAdqm3N3Qcs6TKCkhRaF1x/mG3Ii3UfqMI
	t6ZcXA9m6GzqPeuQhBX1Pswm/jnT+MHgyZuDl/anAqW/Wo1zHIZfbu8XyBybEWy3d
X-Gm-Gg: AR+sD13FjvPXJmuMbCregCT9b3QWi4oFwSnfGSLxUgguUW3obiw4cVVTM65MGewUARm
	rlaxWRCVRQRU0tMxy9UUOeZ+fhGGtYqP4A1C1pl6+GHsjFynGTgE04H1sNERcoSR5Oozcp1/5Fb
	r6v7et00UJcUtfqxH82tktTUw2ySCspdpoABEPpS6DYqLEbElhnyFsfQgvV1J6Pp431L2JtmW5B
	74rI0SDVJa6Fk/uo3+dPoBEOsJLM3Z7ikPZdbtPcwRhKychARgyieRxGYKm/0bCPfKtszCFumF2
	F/0JuTFXdxS2eTE74H6fHDabrMMnaXYlK5qQz0JNCdIMv6hUujwvZnapD7ObXrdxg9LX8UoACGl
	j1C1E4iDVFnZPs+ATCbdF6GQWkN9SXw==
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831724a91.11.1787294087792;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-395c39cbc42mr7831667a91.11.1787294087392;
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be445fsm1772969a91.10.2026.08.20.23.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:34:47 -0700 (PDT)
Message-ID: <e2cab6c6-a5fc-43b2-96e7-f46f9a7bd20d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:04:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-4-e70ad4fa39ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX7Ga0jwduqUkz
 pF8D7XK4CqseAA8ovuO1hWlaFtRDVnVy3Z//bXt8cXAmScFKCNtIw7oXdL7fmfUQqmuok341QiU
 2nv5Fp98O06diZtg0G3OAmFmNE1LfeeNjnQ055YnrOYlI5NnWcfL8ivAVBjOSVjdV4vFodAQpk4
 Rr85TTW1W6ESaEEvl1WwWS8tqF/geu8djJLDuN+YKOLV1xBAF/TdjVTpiKcVF+RcrYxKr43u+eY
 I4zOz4w4MaSZlMuAsU031bSsYOEATgt0JrwQ8SDgPVSAdLg5rpTkjMf/1zPi2vKKLVDj+oNdBkb
 kyO4Dv4Er8bDi9PEc9pdUm4zxU4jS4si8isYOsV+gsxFe1EX0pFgmncI3C5DAzsS7plrUpQ8qpI
 cCNUHvVt5ToHLmCv4mzqsmBhSWGgjRleD78G2wpNKzll6EWLGfqiRLTw2OO1C9Vf9PiHg0M400N
 CV0rCkrtuyv5gk//+vA==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a87f188 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VQr-KVQjmy1A4l77MVwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QXdlz9ju6hcDfpNQIzEdKhGOr6nqBPkJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfXzIzvx4Yt4woU
 oq96ij3495VMm+MF8+3Gupaqw/u2QtA1GUnh1nAJQ6G0up2+wHEUB3u0R7UR6Ih3botlY173tqz
 pF9t4pziy4+3rTKgyvOh0kGeH1HO8vQ=
X-Proofpoint-ORIG-GUID: QXdlz9ju6hcDfpNQIzEdKhGOr6nqBPkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210045



On 24-07-2026 18:12, Loic Poulain wrote:
> +	.start_streaming = ope_start_streaming,
> +	.stop_streaming  = ope_stop_streaming,
> +	.wait_prepare    = vb2_ops_wait_prepare,
> +	.wait_finish     = vb2_ops_wait_finish,
> +};

Hi Loic,

While reviewing the series, I noticed that wait_prepare/wait_finish
callbacks and their helpers were removed in:

  d0730006dac2 ("media: vb2: remove vb2_ops_wait_prepare/finish helpers")
  b70886ff5833 ("media: vb2: drop wait_prepare/finish callbacks")

These stale lines are causing a compilation failure:

  -	.wait_prepare    = vb2_ops_wait_prepare,
  -	.wait_finish     = vb2_ops_wait_finish,

Please take care of this while posting next ver.

---
Regards,
Nihal Kumar Gupta
