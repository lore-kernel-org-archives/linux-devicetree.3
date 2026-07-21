Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1756C353A96
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629420; cv=pass; b=rtOwDt56u5Wwxn7qizZ4B5UP8C1/Ex3gSTQVFspv17pzdD+iMllCvMwmxo6135+wFi7o9mkxVrn/Ato0mN7/2qB7EX5d5sJIwJ2eLR+1QYLeTjI8qB60CP0BrqO1zo/Uq9xMARUArZmmo7yio/ubcNagQDayiJvGz3CgRYad9IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629420; c=relaxed/simple;
	bh=dAg65rfGUktkEyRGS6LHi1HlhBVqv2aq5WVTQI9cBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVFuSIpP5oCZliseBZnslSZMnlBgPZIlbJ6zySGIipevteCDaEficJJLwvm/NSo+cMbFwAEmrTDk4w8HKxmd+b21D3GYBF4r3XolomrPiuebvZVoL5IEV8GdjQ8C9hucr75GYK51frvhjAJNoEEB6vGiZHI2LcoDjSDfh1ymCfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkZU9qx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+9NFGkQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkZU9qx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+9NFGkQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L9xvkn4106897
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=YkZU9qx6lnMX4N5K
	Do0b62EpRlotw+/e8mEbhWDllZ3QfTEvVcxyBwNAymMa+RQMcZQyFEuQy7fXxd9Z
	rWH4cWFfbPEGE74FlVO+pJA4iZDM+btPk9jltI5eWsv1UAL6mEo05qZHc0IR+y0z
	RJsUEtKoGNdiMaoLigiqBrxnJsAIW/jkcyEcEb2/Ff2hxrfXhIsfC3c5NR0SSa5G
	7y0HXEdC1VzjBR0o4gRORznyxuibrXiiQ2YD0U1oyc1mN4nSgSvfjlan7Iy2q5or
	tQ7kd/Y3Ni1XNudl9Rhgf4CDLVN9VCLP+AO3YviOI66wsozf3nEO/8J4yKJpE4ju
	0TPZmQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnaq71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6651da40ecbso4142912d50.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629416; cv=none;
        d=google.com; s=arc-20260327;
        b=dqHderDFfdlB9fIFp3h3MYTzmvAo4/JYfmvme+w0x63s5sZJNj5Moe4Fy/IGGugofj
         CaADKN1nQIssYdAX1NSip/mrxi0WFsHG1lT9oqGWexGmdotMnLRxD6526ypa+gyCAaqu
         wDQF7/p58YUwGaT7gWAqfuvI+fjWA6Fr1wnDjz52mCEGcInHuOyXuBsbTzucR7+W1zCm
         a0HiyB2ObmshywhBK+FbfUYxiZYFG95hLQIP//ICy8xvRS2qusZIy4wqZTNtZ2toBUiq
         1goGkru5mdxiMVV9I0dx11WVwY4CfnELQt/0xqU81kRREy/7iWuI4NRVNb3UmUOyQ1za
         +BuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        fh=oLbYksu5SR1a+sCP0qCEUXOIL4zOXlmNMz8IsoNrtgw=;
        b=dIaCNlIxDhOdsu9q0043ae+VdT4ymA1BPXwejWoz+BNCaNZNUvUEbIltL713PwAE4v
         h5OO/RHeXCe22rgrOIPU8ldncR3LcRVLJ7Ru4MzAzaW+CwQV8ag93ruw67DWWyrucvm9
         CMqBHOsLJCAp/nIz3I/ea7E7NizyYvTjbwn4aZ8pXwFJOjyTYZ4ZUaS3JtC9s3RRdZy4
         LMcOgR+knC7Q/pMC39ztn1uvTI1mh/cyp/3hVtdANMQuiK6bnkSz9Xvf4ckL327ifyI7
         DHk6uSGzgG+NCJ0vU77ITshFE/5ngmnXsdGGU288tAZhwSwz6pm65WnYO1J5EjCGKkM9
         DGsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629416; x=1785234216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=a+9NFGkQzqDbR4UJTTXL2nX41AQ2LKh+fb3qfJ7xzTcCnZBzuEjZKlsriGLROVw9pm
         02K8x1LR1Kg/31neA5TeGFddMhUCGGESNaKaTpwEYcNIZUqb8WV7R768NJmbeatVgpyX
         A36Dv5177kb3gGouuGkOGq9ztgb016vjqB6ihO+sd1TpinEOrexUaBQOBAUJmmfryxgT
         DsA5d9MmKIsZ2TbkM8/rY5Ugmn6dJm7rauTie/S618CWKYy5dZRCVgo8ITUA63G0dnZg
         CA7OnLAzpDL6Q4zGNcEaRacNRhQef73krPY+Djj3ta8RRnfdWv0UCqxMZY2395o2lRjA
         VLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629416; x=1785234216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=samfkY6+c0RKXbGRDVbtE8X9s2gylzwW/5B3FCT2Dd5Oj+cp1BeGOkDPGkqZ2KcEU4
         SXHN/0TPK3YwphuK1+ihiRml7skcOP8cjAT7tlU746y3PXKQMNcudvFlDP/NHmEHKGVT
         qjx3JcyID1gdkDLZqCzR7N4SuW+5gHrXCs38zJb36xMm/Z5DxLMV1LHzpb13BtYktQUo
         i/THSjHWOtADImYm96iNExfbVPOUucVp7xX6qC4NhuV0IIZZ7n0sqAjRrtZYZB/EPFDn
         jzl4SK8GrRRf0QqXM1toto3onH4Nx8USrYZPtgdQkCP4tW5RZCzFgBi2qlokA5v7vO57
         OjkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTw/gH8aYZ9OGMEzWj/shnrBoPZml6PmF6dKIxerw2iOe/NnAg9USrAX1h7ksikQjny5T4x7QNqJdw@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7U5jO0vxdPyoZgM62MifwhKV33nJ/kqkSc1/siexOyWQV+P3
	8AdOmswUD75G5Rb0ZoGG2IomFye3OEj1nWwMeM1oHiBj9PGN5NBPB65x31TfNe3Rw3vLjU1OoDV
	YLDx8k+4Lh5UZtcdBAqhkly50UI5QqetLDp0VhS9RQh1ehu7O4EpOS8Pv4WnVD6pA6I3B4b8H7A
	Yxv9UPlE7dEFiUbR+Q8M9M9WW65dl/oNH5MjKUqQM=
X-Gm-Gg: AR+sD13DekFQ50Igr1OkinDNMHp+7GpTQPhWuVojmc+bZuysfAswrZEDugr5lgyNvet
	rCaJLViIq4tKj/fWYaOfrxtVTCQE6oNvA/KkLrQ43RrXff5SHVF0MfBxUZr5i4KIdcZvSXM8Y5J
	/rh+pk49DluhTkqQS45ktUD2NPluYufisY86EbPh6IiA5WiZ8m2LRpaQYYeQ==
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id 956f58d0204a3-66885e80a8fmr310985d50.38.1784629416567;
        Tue, 21 Jul 2026 03:23:36 -0700 (PDT)
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id
 956f58d0204a3-66885e80a8fmr310932d50.38.1784629416151; Tue, 21 Jul 2026
 03:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur>
In-Reply-To: <alJpc3nFX9D7_8i1@baldur>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:53:25 +0530
X-Gm-Features: AUfX_my8FmFS_RPsD9P_wAO_xi3w3rSS9J18xqmBVD6VnuXnMyKuUdz39cXSwBQ
Message-ID: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfXx9zoQNAlGZRI
 X1I+3xPYmG7UlzOEMSv1lV4cx4oFAhENJMG7oWBLKcbvdgzezRNFqC2oY8Wvi7D6SyNrW5nQUrT
 bqgONpLEn0xAu8RNXlEGY2XAg/qGdxLR0tpEWDa9IdYj2IvSOORzpOzHlxqYH6+sOVa6NT9eT4f
 IN8BuCuV1zy0Dcdd1uoT71unsOZ9jF0EvJpgRkCgPkFcqWjfEbmnALUKb248+6kukkZccUwwbDF
 +A9r0ywNolRXFnvY6f5pKL/lPg8X4YGxK8MZptzg/Y+ahVLLdwD7SAaNyCNsgpBYtRqYhJ6bm3a
 4nVvfY2GDR41Kfpm88wdHgTm3owzH24BUGrRbUNrjsHrcd2RKctdEoBR1YVjlFGfSBRJovveAnu
 LBYh6UtSheiTq7fO1hPYbV7p2BBooqqaRRKC26yF5Hni9oJOiLVyxl2SUF4Ho3Em0MUs5Ka8X09
 mTFO/iUWLnVqz8BU1Kw==
X-Proofpoint-ORIG-GUID: veoLyGcSYBqjlxCGJ9unVabkfc3u-ziK
X-Proofpoint-GUID: veoLyGcSYBqjlxCGJ9unVabkfc3u-ziK
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f48a9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lt5aTsHmsBbDyw7JONsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfXxhobkxFq3ABS
 mpayEglw8HI5vMOGSgetmaBY6f7ZRDhdelmTM4IedzMS+fOYhNBI8mrlEjg4SEo51tDRaUAVPC+
 rRpUfBim7t+rfdHN9HLY7RgiqihBJNU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210110

Hi Bryan, Mauro,

On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic P=
AS
> > TZ service allows to support multiple TZ implementation backends like Q=
TEE
> > based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
> > backend service.
> >
>
> Please find an immutable branch with the dependencies for this patch at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702=
115835.167602-2-sumit.garg@kernel.org
>
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

Just a gentle reminder for this patch to be picked up as only the Qcom
media client is left in the next branch for migration to the generic
PAS layer.

If there aren't any conflicts then please allow Bjorn to pick this
patch since the cleanup patch dropping the old SCM APIs is blocked on
this.

-Sumit

>
> Thanks,
> Bjorn
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
