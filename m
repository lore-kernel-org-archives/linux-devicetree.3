Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE023845CD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332372; cv=none; b=e4C7+Q/o+a1mj4PAhrr4vm++Z3s+vkrUiO2t2Zu8xOLUckfeWtKKVDz6UiT1r8X0Xc02dFWDM+7Y+ACRjX34G1h2eKZJg/xznFXdYRxTQ/XoF8Op1AXb6d7ytdADY4YtFY8UFg7tX0WZaxYwX6WxrORRjG8YAGIJ8bx3hXCyanA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332372; c=relaxed/simple;
	bh=ZW9ofNaaEumpSf2q3QMhLy/+OoegC2Wk3bdQdpknPRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZycofKUt2k1A41lIglCkq+8u8/CG5ascIkVWO+DpiFeCd6uGFG/hjfXVmvEDzON9fKmEePcVOg/zfmKXbJ4btGxYmSkYjYnnSjYMi21U4DCjEN7nBFi8cW6f8tD1ii++nUMJ6Jotmk71dYva2on5b6Qs85jbZcxTeCwCGPAFyfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1ChI2lo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr/PwYSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1ChI2lo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr/PwYSw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEFn73418105
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kk12mBLAFELG+8Y8fFDe+d7lOJBRnJtueIom81VofhA=; b=I1ChI2loDJLY0fD2
	L4l75db5a6Aw0GgHMCLUo05/blGAEK9Jzmwj5LvswSj9Xf5v9cKwqoPpai3ZiRWV
	0QakLPOovVf8b909wWZd4HmzhY1d5N2DYM4w6kG9pbv1qB1A4MoOQK8E5RGxvNTP
	jXk9Yz807kTwWA83vPhUAtbe3YjLBugBJR3LXlURAeTlqhmzZQZhyB6vMX/WJ5mS
	H4tLULxiPC32OhtVos6edOlE2XymJwpCZML2wBqZ4+fGRc8W3MVqG0evA5JVgK/5
	3Ldddm07ti6U2Von2nR3PluKJV99BeBMYcmrVw7V74u3bOlfbDZHV9e2FG3oIMC5
	URgYSA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffwhfr44n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:52:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38827cee19eso8908609a91.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784332369; x=1784937169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kk12mBLAFELG+8Y8fFDe+d7lOJBRnJtueIom81VofhA=;
        b=cr/PwYSw003SAASRXBAfQQONTkojbSxXR9oSzERH2XzhfXVZMHIk8XkywumHzx/CYh
         V8wxPXqjLbL0ZGS7zQ8rgTdLItNNrKE7tIOCtTxvfy71xR6hU7Y59taNXjvfReMyg1l/
         54HlnJKoc8seIL0SZ+9ynnxbcJy5s9SYgJi33pczNQBSr/GqCq+SFIajbCKuoiAFdpl7
         CAFqq2QiUSuDxhR5hi73GVyDPncuk4dcJpkKm8iQWTN5JOw3bEY9e0ZNnPjaI0hzDI0Q
         IwtKuz0hFF+J/IH5a3O2gB8/KuKibbUwyXrFr1pFJZ+s8j94RwIjj6lU7MCMr25Stnva
         MzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784332369; x=1784937169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk12mBLAFELG+8Y8fFDe+d7lOJBRnJtueIom81VofhA=;
        b=NYYSyJY1RZMDAJLt7YIQDxITHVUJY+6WmCyj5osaoq6r+w3ye0X9lPi0HK3xnaC/vH
         ZPQv3FXObAj1U2PiRVxQMEEGsMIPx8T+zMyOm8o0JSftU3YW0gr/It7NxagpqlLbQJnt
         QynEhD8zFvyKj93vfkbBjvfGASge1kYBDoVozemABDTxiWXkwb7P1ecaSCQRrVzFWXnI
         i5U9baPCUtl97gJ3oKiD0t9V5Cn9DGdMQd++TOgX1NGGlnLQ0MLINBHHn/TvUVlccr90
         +rUJ9/HdTw7tQG9UT946h2utVie7uV5kLXvE/MVX1Anf5/7X2ueF69BGn535X4AG36rc
         XHOA==
X-Forwarded-Encrypted: i=1; AHgh+RpE7GX+w33qo+fTfmlLJMmWI/eIiDJq5N1eWPDpubyrYM8tZyqBFUtIa2q+/sTKJeKh3z/KVngsxfNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4f9s57GA0dRUFadW5matBZ8xfYGJqnqrgrfa/IvlXsVXtwdp/
	KC6eDGliyMsTMJ+CmM/As2LzeaQiwstlyqitsjbdBUMIHm01nDZRlz5UQFQh4J/ckWH9FEiJpRQ
	7XtBFW5MWl2M+Y1feVJBWuzueCDxMYRuVMWTC48hrsk0+TCiJs1V4IXOzGeUFjrfO
X-Gm-Gg: AfdE7cnHO2QlglNuMNXb49w5vWnpW6ZeNFcJeOdDX++Qo6BaxuqQA7CGBk+LCsOqVnv
	toHZEdghDJZbUkjYM8alMLxV/KW0cSKEjbvcblJQkOmjNwclG+SudLu2J9py85bQR9d7mMJuih9
	bxNDuPAEelDylvoMKh++lqNqqnZq6FrnwzWe1KKA3812EuZUIlaR/zovFhUGKcBP7KKSRPZl/W1
	ywHtw4lweS41F1ZK8x1vquqk4qR8dzC300UPMwKAL50APoZ4Y2OHT5bvsBuTyPp2kihzn3aVPHr
	qkqS1RdveyXyVIQLNQQ067R5TR0rCDq7hNTEJSkgh2zVgBVm0QsiwXJdKvfkkGgXtPXXuzD8LtG
	6/njpWUkx7RgeDAEB
X-Received: by 2002:a17:902:d2d2:b0:2cc:fd6c:c5c9 with SMTP id d9443c01a7336-2cf348961ecmr54352705ad.4.1784332368572;
        Fri, 17 Jul 2026 16:52:48 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2cc:fd6c:c5c9 with SMTP id d9443c01a7336-2cf348961ecmr54352565ad.4.1784332368141;
        Fri, 17 Jul 2026 16:52:48 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee37sm18828825ad.14.2026.07.17.16.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:52:47 -0700 (PDT)
Date: Sat, 18 Jul 2026 00:52:42 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Stefan Popa <stefan.popa@analog.com>
Cc: <linux-iio@vger.kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <nuno.sa@analog.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add maxim,max40080
Message-ID: <20260718005229.5793795a@jic23-huawei>
In-Reply-To: <20260717123852.1140893-2-stefan.popa@analog.com>
References: <20260717123852.1140893-1-stefan.popa@analog.com>
	<20260717123852.1140893-2-stefan.popa@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1d3sfzLqIZFCUHydL2dYmGX8Eh7Bzq-l
X-Proofpoint-GUID: 1d3sfzLqIZFCUHydL2dYmGX8Eh7Bzq-l
X-Authority-Analysis: v=2.4 cv=ZKDnX37b c=1 sm=1 tr=0 ts=6a5ac051 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gAnH3GRIAAAA:8 a=Eq6eYOmURhmhu4GIWB0A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDI0NSBTYWx0ZWRfX5GRRKTALJbhf
 hKqor320hnxhVw2v9+j0hshiXNYBS+/cOFsxJP3uvsdtrePkQPT5nEp4YEpWjEx+uanREoGUfNR
 y2Taw4wu4PfnjYTFO+/NXj+RkHHmhY8fDgUvu2om26kOQ0894Z14cDHowQU0S/H287zki4SpjIh
 RANz9ICzFS/iUVVjPI+pwhHjV6W4eCNK9Ei6oUihIQgXUQeX6ENe0dYUrb+91sZh5LVs9Kehmd3
 5HR1HXqqrP7t8AOw+BJn1SWW9TjQ7NurW2Uia5KlY5dL/ySMLj5GMTpxgssyPc4jfmDs+h4jCCG
 dZvlEdq5oIKdzlxJAtRwewaFbALDq6GIe9YKvVyHE4VikueqK5T4a6H4JeSXeDsMIgGOLPI1yRi
 Xf2KetbzEoxDWt4+T1YtOYOgagGO6lubNGjrUwl4796UWxq422S+rRntC7ZbIyjs/0Go+NAWVAM
 4Pv2P81oE+Gdsu8CpnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDI0NSBTYWx0ZWRfX81LWdwlgbcGK
 sfPjmMsThMkOszuCx9weTwFZ+9VRP47goaahOu6co4zdxIAU/rIwKktYrMuz/MB9Az52CdGCOpV
 8l4BBt9jZ5BhDSm5ilPTr7vFEUL5XFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170245

On Fri, 17 Jul 2026 15:38:48 +0300
Stefan Popa <stefan.popa@analog.com> wrote:

> Add device tree bindings for the Maxim MAX40080 bidirectional
> current-sense amplifier with a 12-bit ADC and an I2C/SMBus interface.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
Hi Stefan,


> ---
>  .../bindings/iio/adc/maxim,max40080.yaml      | 64 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> new file mode 100644
> index 0000000000000..3b367071b5d3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml

...

> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN+ and
> +      IN- inputs. Used to scale the reported current.

How useful is the device if we don't know what value this takes?  For a current
sense amplifier I'd kind of expect the shunt resistance to be required.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@20 {
> +            compatible = "maxim,max40080";
> +            reg = <0x20>;
> +            vdd-supply = <&vdd_3v3>;
> +            #io-channel-cells = <1>;
> +            shunt-resistor-micro-ohms = <100000>;
> +        };
> +    };

