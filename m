Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E338838B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075433; cv=none; b=GNz45+vYbJUoSCvlTCRvnUIsXBUvxCKa1Pmq73WXN0MVqy1qhGz0m8sJet75tecCOrpOLwHkyUXEA3oLjhxUZ4puRumC85Bd0RtAm/zUy+xemGju25qqjAvYZectlWem5uIc4KmybJXKI9C7Y4loUI39l5UryFu2utdQkQUDxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075433; c=relaxed/simple;
	bh=DXjyIndIDwV3dd6kJq4K5YDy+8+s7quV+iZlTF5mzCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAVeduAffAJAjzRiwi1JnSE7lUi50SKxtUf133E4JXbQUwLDtbNgTn2/QbjORybuRlQ2hMcEaY5sGBHlU9FomdQqxb8CU5XWZKIEN11Izvn+FQwuGHkcaeaQu8fFb4qDzA8buhHLeGwcATzKTUYoAkXIDV+uG4mVbyji36BFGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjaBIApH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjpQhgLM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjaBIApH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjpQhgLM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jfGx1955778
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=; b=UjaBIApHvRcGsN3E
	zZg8lbX6CeNRwMA5Bs/oJPMq54LfOrzquf+qSfrNDQPru8CieubfmHPWMRcUKuD2
	w2THhpjkRYBPQSBFpisG9cQ04zwqgauizi/uANJ9oF0XlyACIi/HDgOiqJF2IY2G
	vheBEfPmOnjpltaEtouQ4k+c1iMAdmCiBu0T1joYJj/tqo/56WO/64GhHyEksALa
	XV5tK1iuwlbXbKG2QyD1Pz4jRsCJd+Gy1bMi6YbHOcAUuM3B9GYw8WBeKZxtAenA
	qutyrf2JLWqNIIH+BuXumNvUlQPh4Oh3AH0DLremXkiRgE4VycaNhnDFnDVFQB85
	RlrIVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeuef7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so12634816d6.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075430; x=1792680230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=LjpQhgLMWCIUaPNUEzE1ey/te0yiQhXadvuu8zWyYOrYqDFVNtbs43dmfLjsHjnd4V
         gUAlgG1+NrnXrO+4mxKbrfBwdPamN6raHxqqf1jLO8gVFczk7kTQOR4/YD9z+yEWw0J5
         zRA67FahwEKVdEuTAAjAc52okSqXJYRFOpsvEh67TSBlvPgj4OA3N6guVewQWnBlGeKk
         dsX6d6Ur4d2arIoPduCzZi6BHaEb/OAKbULbXcK0G/ijl0uWx5Hi33MUG5LjcseDEW7T
         QZN3caVAWYccTBh9V76YSKNh+O3yITpEaxMV38gqyG6iZCO5gZopAXGaUCjXg973CVfQ
         Efzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075430; x=1792680230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=2yGZMuqc3e33H29gZQbfq3RxgpapceZlQbs1Eg+N1modN2N32pndMJ8g7q54YaucH4
         Ot+qXJok5R3xsF+kBBAN/DaAJMUVVZDk6tz0Z8oChUWvCLke32xsJVpucqciCLRu7Ayc
         8XOvSL68R+rXHi1eo/pAmG5RDZQ49yEHiABc3MpEHQuBIA2x4XDKgTSJwppRW6ZFdbTa
         /ATID6R3fWAL0bvV6rayf9oVPHH4MTGKaorUmLmKI0o9sYbA7mSVLZ6cROuytVPabp/w
         /pa4c1s1y0gom0Ub+nXZjlyNVwv7cYLbicvJOtdNnvhpYr7XLEjqkKYICIYfkB+zmqgw
         5ZEA==
X-Forwarded-Encrypted: i=1; AKwUvByuqVim4uNLH5pozYjvyh+vv9c8HU3GDkUQM1q7kMiuTVm8GJZQuxovrox45CSb883oxf7TphcQFH2x@vger.kernel.org
X-Gm-Message-State: AFq9FYIJVrdfK4RylJKcqqkqXkpBMzHHD8h5qWmve/SEmQ+vfduWCVC4
	jBZ8ozCj91YTA9jyZcmuhWLIVTeU06fQ0oCR6unXIk67in5Miig5+XCSxjlNT69BtdnZlXVnMcb
	6MK+Af5e9amUCkfkRGqs3U1nKOo0hPFGFp29KTkPmUe1JzZGMR7xPc6w7fCUnixyp
X-Gm-Gg: AYBFou0lHBDUaR5fN6byQOk55rzWv4cmF0nr5CIvgiJGn6hZSczm2LPgzcTNR1Z1rc6
	7eChNt0+u7QUj0ADMaQAa6wWOkxqbyWev8Q9retrDEewaaj7YTvJcmCZeRU59SYT+oF/h6sFFo0
	JVPHRHnNTxZOqidwSggpitAni2Btbhv7VtUigJQZmY58BPB7nZAAI8xGki81K7AkrFLiVRGbUyq
	/QWoTaCkQbMavgOpeF7gKvb9z5b7eVxoyBwTzzNXnyjpNNonLFwBehCSbaH3X/0Qdq2s6BMKFhI
	0N0R8wOry8TFDLT70bmUkcBV+FaF8na3ntG0vKQ6/MM8MPoLOMoF4iS7iiSRW4ynVwh+XMcF9x7
	vtoe5BQYja9zJtzO65q71bg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654726285a.2.1792075430437;
        Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654721585a.2.1792075429968;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm136191466b.27.2026.10.15.07.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Message-ID: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:43:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0e6a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: q8qXN-SL14WjdhA4RxgcrMf2T7T5VEsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX6feQiYGL+wKe
 30oB35klnVlYuxH0ksQf8+pEnQKSaxixDQqeIwTP8J1Q/DsFsTbw1R0V2YmI5iq14yP6I2Z70i0
 s9GsJsovDKdv3LKxv0tf6xIgg3DRhKLEj1Nl3t60aeQ2WN2L+EWmctmYnOMwMJ8BsbtoMS3Ig8g
 IzYsSnz9ULp6+pHq9WXvQn/4z6HwpTMGOpHfeTSvQ1CnPGx0dgzcm1aiMYTStU/EUvaCFJ6kfnH
 HGTGRjKeW3KgbUy6jSY2gGgDdzB7k9fLQI16YI2cJ0BGRNvOOe3zeJjHu2C56qW0DCq1KEoA4aD
 TlHurrrRkU4Akr9J9iCKTd4bH5SjfOlQe4T2pJDhOEdmEtTgbrQ7Jozn9T7gUVBmK+2UdIy8UB8
 ZJq1uCE2pnAmXL6ez3W8R42q8t8MDstLiSbHYyToz8tCF91QGi2e098VFIReusFRLUWfCw3IagF
 XfZ7pJyocEH41qcJ1Zw==
X-Proofpoint-GUID: q8qXN-SL14WjdhA4RxgcrMf2T7T5VEsh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX+BpQecbS2M65
 uMoBheDBwwLM3UXTDltqt7Y96ssbnX9iEIgvoRWT4QdXHx4pxwQp7Ew3ccJaAnw0JK8wNHXQjG8
 Lvb2+UsUMSBrXk/KHGdjW9sIvoVZJeY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---


[...]

> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}

This will always probe defer on a fixed-role controller, we should patch
dwc3 to always register a roleswitch

Konrad
