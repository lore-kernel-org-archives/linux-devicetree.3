Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027530;
	b=4qgov7NHGvReUP+7kYF7T6H+9wgF3j+eijBrOURsZ5R7R6rimbWzy1K17mD/8QlfQDX2
	 x/1HU6MOTC6mO6THiXKOnTpYDcY0Ffvpw+1911TztmrZZk4+caUJfZPVgVhgVoa8qa7KS
	 siZbpeXZ68Yut9B2gkDEGNhTiXiax0pnjtsEJlbb/JrXB+4gz+vCppxgFQp3oMHlqvq6K
	 PfrxshR2aeH9uLQhnU7GuCPKRR5v5oFHcCl4vDS4GAMxpwIwLMxTeEYgFS+6B58Z4xgUT
	 KEeJLSbwcQZwwpS1LoK51ZWursuksxhuRT28YHIg+s6BrZlqFNHzBbsm4zoh72UZK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
	b=irtym27JroT5k4jO7GmvW/xQSM19GNEgar7/fzGg2ptGRoKYnn4xqNmkHs0zkHl8WVRV
	 Z290Jvxcu/eJ8LwWw2iVDt8mOJKgZ2wzg7UUhmhAQOjk7GF3I5vPuwovMPsL5J2TmuZaT
	 8USO1qIOBSg5cJbrpHPWctAs/Ic9fIRwNhkcL4HaT0Q/PrDq562zSGVz097qJ9ptU/23+
	 M5jS6EnY8tsoSEs+QaeQL75tWU/p/Q30KDDygy73H23ArIo5+crD8KC9zU75tPVxJbpJt
	 G0wFlvdBx4vbMcF/7EIo6dnqsaWp/qGAvzv3HILSzaOyLSuEjOHYFtqZK9FelnIWfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H0IHp/CN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CA60A2611
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1CA60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0IHp/CN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGBk42745588
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=; b=PZYjwBB81Hid/zVF
	k6/+pAP93fHhK+aQIKnJKf29J7JdoNn062YzdC8vc9Zb1bEqqyvWIv4OJS+19vUf
	kxA90Xa2Kxu+qUUmG45JZcVby9g1LmyUdy1vtHGndI/RkrFOBuEevnhrfksLJtNP
	sMXO3znsSFtYYZHzFZFvNNO3y5cJL9gGK6w/YLoB+N9/bEPtXU3cCRGrnLom3Bzk
	rSl1HQMMQboo/cgac5Aua3XbDUBosOCQakRemjfNYA/yN8Id2TG74eHMSWZnM1wG
	nuHAX1+/tSjS+mbyEr4RXsG3CP3cykrVxxrZVLN4Aw/4IlRZOiNEldSC8txgj0/a
	3Xn8sw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpngkd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1398165c88.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027520; x=1795632320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=H0IHp/CNJNuZlxpsyggXt/uDAa7H0Ax+IIlX2v8JxXQtmJ712p0V6cvUIqvKtL/z8l
         KlSOSr7mjpnaMERa9J/N/mDNrevHGzxH9d24cwQonDF6el9wbAyObxDiypJGRFPyykqq
         SFr9wTUvxBbs4nX+3dLL8hGSVGvimRzfQ0gZjuzEculQ/QVSi5ncDu5+PV1MtrvNZCLU
         S+ltBP2b/dgOa6qz3rS8mhf/WNKse6TUu3e/cNyyInNGU0ok2HiooNE8CoIHuR0fzh1L
         7YEc2JOBkw/En6ZzVs+85ebeaw42+yyRN6PLR8+UonC4eNU2e1epRObE1TgcmbzfrK4m
         nV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027520; x=1795632320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=tjo4r7ZdwrU/5rx0QiBeUJOHEYuxm3hgNUDN1Ucfe6ioxn8LqpGz/Ok+lXouSVG0Ys
         cqLWzDr/6OLaFzSqZe0jyxFt1wolGhmQeVGXVv2BlINb2/dF552TFleqWTwHbup4N6SC
         xdJhG6Wi/6wIjaQFAvGP41YURGJ/BSAponHlPHJ5+Pewu0SlW3r2VehXqWXENUoJ2RHY
         qsoTeIJNOAt6dBLKO2Z1oyKpTHMEzUjYhegeB7BZvDQI7UwMw6lhtQNBFTCZ6JomNcLL
         DN3Ef/7Pm9xI3uogNaQy+NbZMQFAuLmchV/2q8j9dGxoxq1Czz4txB+EO4gZSwr0JOFr
         V3yw==
X-Forwarded-Encrypted: i=1; AL+hErHJBb4OxUmfJqZO3xGIMMhEj1W4e6J40qC6i0Anp75zMtZ1iMXrq1dNvkM7etc0OLelnn7xNrn9M2XV@vger.kernel.org
X-Gm-Message-State: APuU4Z9mBB4PjXfHmlZuLoicAKN2gHzNoroeQ/20Qximu6k1jGF5tyXR
	CQ+4xBDpN4P3GpvER5pbP4eRsj3YM5RryTV5MVW+TQUacj5EGu0sRyhrkOdYLBqcK8IeJ7ykicr
	18/vMDGmlUUj8u7+Tmgd9gZv/3rptuw/lreSDPVQOburRxN50e/dsHzYR2//ITXVi
X-Gm-Gg: AYBFou3SNm05G+4D1S7rR8YX4u8uHcAmAPxugLDaTDbhtvy7wKREU06alY6e3H7z7HA
	Gmf4W0SyHtUyFxou8y1W0MRM6KojX+B0lFpDx33CCr9FK5rC25vZtbOEgCcjG5gEa93EPHdLJjx
	z3bGsiJzmOS2FXitGTVIx7JEfKeRzC8lLzkr9I52skhmQpZBu3sZ0eHwmNEv1YnrbMV8SkBonoU
	L2s0Xj4AkqZdpDUNmmhnyM0jY6TOxbl7VUsMTxcN1Ln5CnHtbBU5lbp2VXN9/YWQizl8odVQk1/
	rr1NpLIMoBZvCBnig3YZuDqhpj2yIxs30V8Ij1En2avuhxrJY3NjrT3OWdclgDLo9/zLk8w3Qc1
	FJVuieHGxBYqmHoCHoRCRYkHf1Ywej1mH0JrEBAgwyLOdHNrEyG2AD1xb0b4RJB8/6dlb8kZW+w
	==
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282672c88.37.1795027520227;
        Wed, 18 Nov 2026 10:45:20 -0800 (PST)
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282649c88.37.1795027519445;
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm12271571c88.9.2026.11.18.10.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Message-ID: <c495dc29-5af7-4abd-9608-43b0236c15fc@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:15:10 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZWVpo34u4qV4hshIjlwl6nzt35iKffMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX9BtNByw/PVMF
 Ov/QwXXaLx2Uell45xeT9RacmVVp7a9gis0depVGJFkEyBp3GvpPnd8Ms1hDwPx0BQmiQq+IGYr
 vdvpYZ/Hj2nACslcjORF5DH/eS5DtTqZji+tNntwo4eSiHxpI16Er5l9lEeOgzbGIuuiFuOcWPT
 ye1yr+XdcczmO1mJQWxmte19lF2LdNKR7amOmpgEZZkGLY9V0nfKA57Uo5nxNy86lxgxXTFIzR8
 pwlvJdCkomVDu/WDi6fFdkKmHSNJqkr2AzuLHkyUlUC3QOs5+JNcRGoTGIfJWNQqjtOT2Oxnv17
 fkUhfQc8K6ik22KzajtqotjRxFo6K/2jlTN8lF8BYOl3UIHvnsgd5DywfDyKmanrD+1isbdzPDi
 Xy6XddvRyMGw0Z6U4WQS0vfTQ5kxLPh3FXwCqKrI5g8hb9VrkOkGxJbbx9tCpTAP89vj3Cf3Q4v
 I2x10ddVsBhwIgkEA/A==
X-Proofpoint-ORIG-GUID: ZWVpo34u4qV4hshIjlwl6nzt35iKffMx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX/vA3zMST1bua
 5tWhyTFUVWSWTIER5WWIvXhUaf7Ezv0qVWcL6D4MmjcFz1s4XFl2VbKbv3MBGck/k7K+QgU2V0d
 zLg4GHxQH3KlQb01DPYnfn5s/vl2YnM=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afdf241 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Rpd184sqDP2D46n30CoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The CX SMMU aperture is a register block in the GPU. It holds the
> location of the GPU SMMU context banks that the CP uses for pagetable
> switching.
> 
> On some GPUs the block lies outside the existing GPU register regions.
> Add it as an optional aperture region, so the driver can program it on
> platforms where the secure world does not.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3c90a09febe7..5e4f3149839e 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -54,7 +54,7 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    reg-names:
>      minItems: 1
> @@ -62,6 +62,7 @@ properties:
>        - const: kgsl_3d0_reg_memory
>        - const: cx_mem
>        - const: cx_dbgc
> +      - const: aperture
>  
>    interrupts:
>      maxItems: 1
> 

