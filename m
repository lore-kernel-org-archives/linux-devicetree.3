Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485652;
	b=AbWqv8PCsHMsjIFMfEqVcIVMI3JSkG7qQOPk8MqA2YDSpGSgQ7BOR6jmN2wnyASucyrc
	 2xpO0TBJYdR6M4k2Wd+x9eOe84ss31xvEoqBcBieoYFtKdO+c3khkwguDfZRo4KYWY3kF
	 p7+UVHGqYk77O2KoEZ/ALa2NHPHhqkE0vc/Ff02f4bdefIIFBF+P6QN6LkpOAlfjr4Lka
	 Smea7/yd3gRxIFSpiWQH/iTMKg2SxkcvbiKNhI9/ej6ZKMGN2l4ZjKKn3U9NNJC5pYO8B
	 /YT25fzhilTfaR+FRnIj5F7z6lvQJzyCFLOTHx9oGHqw4b+RMqi11xlss7rQeAH6KHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
	b=TPl1N2Gm6zsLDL3YVTO2tekylAbkvWxqhTYI+KVXchhvnJyBd4hPWq5GgunYnOfEYbBr
	 4fL4Ny50Oht83uVYN6a4TCv6nyvk7StYBRshQ3+IvylIlkrpRd6GuPnjfkCuYe31D3hAC
	 h42Z3bbhZBBSGdyl2rR8rG3RAQYEpqPTeM2VAnVhF1ncwjJE7l9OM/pRzCI7AgNx3VANt
	 /ejU7/fv3MmJ/sFufBVU6k50VpaLBh60awvUuPMRypKvHLoNoN6WF9YYIpL40VjOih8iz
	 yZU2QfrAjyUaF0Bu1OUxpIoXUfW7Apx3TR/d+coBUkZWNSVuiCldRkXnnL+lTFQls/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H9w/UWrS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E588606A325
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E588606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9w/UWrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8BlFl186035
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=; b=H9w/UWrSJeJbIX2V
	nQvVTHUIk9+AcMkuDcfmY2K5LPB0d0/vQLZHvKJB1GgwS6ZgpF/pon2XuNLsY9O2
	1AqS0+1qP/h4mkLa0SpqgJZAr84KJmvCvmsi16dp1PD3SSnDLUEiGdDAK6FIDEGW
	RPI7o0ubiYL+rz+89OTOpRAqZyyPKwTZIhotnABdnUUaJ7ewhFxvNDo9/ojIMfU0
	G0KtJwMh0bFnuUs+5iMD2adcHim7C1qc8efMuZofUQirKu9vo4Vy7z7E/g43QsWn
	AfN0KDuPaAsmc5toNeN2hU/MviWMN2N+VeRvi6O86ZbM5wNUHYHfHT6cdUww0sNU
	e/TXJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsny8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:40:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so96821285a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485650; x=1793090450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=O7Knniqgo56R7scxkIF+MG+oHs9XMb7exdylrDF2sEJsub29TLyjGqVcvXtX8oF8m/
         uYTaPoxg3zZj4O4bINfv51LwSeRh3MAbc4eFIf3vMz0nU5tabRuFXoIWJ1IbslFK5Q6w
         AUyCeiETrGly7eYTbcfGje1horoJdzLYHo1v7FAvGqRZcn4d0vfBqkETYzM210dnpj8U
         ttJxGmqW+QqvO4x0WU25MJGK0CAnPJCW0zvgvuZGWor8jbm/2UMxguI4wsXzzkuCnj/P
         ELkQ2IR7Zt1u+lioLorPoJrj+klDFt872DKScSnxcxF3+Xu6jtbx8K5tTtFFZbnSmWiJ
         g12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485650; x=1793090450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=WcU0L6BfS2nMJzPzCm4EquOD4SEmNMfNDN/Z1LosLHVQifvLOSMdbxVDm68588OAGv
         r9fR0KwyAb6khCVr6pQb3zncoQKHLsQ36D9acW4hhR4eVl00tbyWUpzo2oXDwu4JrzDe
         Pk69XrFjixj1AFKYxHnt3ojkA9nqt1dPTHF96lOSbWqP4MKB9F/Qlotayq2Ih/MLQEwf
         fftCe5hioN1Y6D5oiJ9hAxanGR6+VVUFYvyik8ejJtBJF1iNpluxJ4fnW8hb/qwW6Es/
         /VoXvfRSw2InhmN96FLT+ni/xdA456hu/91Ih7dKOR9FkIQ9UEZ4eT602cDEKBxZg4Wn
         ZzgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrKvbKgcsn2vmcDcJ/aOhxmYPbWbd2uvGEOvl1mnPGg9SuIyvrKSyAfFyCK8ZFfXr4r3ilQB1Sl2yS@vger.kernel.org
X-Gm-Message-State: AFq9FYLH/L2nlI64WNaQRX7xHGSriyF1zi/WXBOYvhUloFAZslWYh3Pa
	fEzHuJlA4zCGISzVtEjtdJDu+52S8XixyT1fLaLeuvujEqG66xAy7yR82G6Jw1hss5NC1oOs2zV
	+skddbP/Puzh1Fh0ZhtelBQ7MlPbFdMKGKw/gJbE290+EypKSuiO5C2ndIoAONYGN
X-Gm-Gg: AYBFou0MpNJzxcYn3gNMtqS6aQ1Zt+S3yY7qx4Z4rjqs/bEHYK8q12wgYN2MHuA5xHD
	B/hEcf/8rLiC5SrJQFxgYY3yqKaPkTsVAPG6sbfMUh9P/fOrQlYO1RSimsoqCNa1VxnegzsmfWc
	EX+wfz1OE/+SEmmVRh145zy7rXo20ayQY/eQlBhmrrrrMa+XuwWlHy0Ucd7g6lBqNrZ3mFRmPoC
	FQWEEtV6mN5DMQpAcK7kszf+GRgwcGATawOGVy2IDLLZe3gxs+ZvjhRUgpOZHiej0UBNoR9eqxk
	XMsmFz+9zKyal7k5GOZ0wX3iOy2bb4HJoECHySH5wob5JccSpfWpa6e6aVYiGNjufY+VvnKNgum
	isISKjKRUlMFWpCCcGnAYeA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902089985a.4.1792485649608;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902086685a.4.1792485649072;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefe3sm451118766b.34.2026.10.20.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:40:47 -0700 (PDT)
Message-ID: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:45 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fTRjZcCWorMJG308oX-0haaZDDMBN_VF
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72912 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Fpyk1htM9JFkJ419By4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fTRjZcCWorMJG308oX-0haaZDDMBN_VF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX9bvV9sb0pODm
 pnOXV7N45VAG+K4phKcLrRmte+fFkK24ZhYAI8ZLbbCQRnq7Swt7Jns+Y58EVAaDsWFzxHdYa0x
 hsgPSJZ8FraJKUc09KEfu26zPjStLeZlIhK4xbFeL1YWlsEOxZyp3bL2A0jw8Qsa/xYjD7e7PK4
 tNeSdr/jVGdPmWKZtkAsYqnVqIaUhBtHj92825dM9FbnR1qPALAMqtoukE7WHjY+9w+r4sfgjmH
 7CxKD40dIqG7cSGF3i2ZQ1+X3EbH4iiaN52iLx3saiqDS1A0vU8UhEtAkgwcQTRcK37eFfge/pi
 gR16JNMhKhThUHmqpdbpiaf948k6eessFSB9MDJ3yjKc+gUHNnlMpRwBjihSZl6eX+++2gOJ9hu
 50eqAQgZ/OCTMheurl8Lp6BOuBdnOS69v7kcfByFBhdj9EdycniKyPXClNSxgGiLWDJbO4zwCX+
 popYQuTyo3iWTlZalyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX+Xj6J3zeOguO
 Bqi27n6D2jT7lqTi68rYhHem0CeU+D3/OiB0EI0XLIXce6r1U/hI2JD9qg9BYPqkaFUR2CVsbG8
 O758SdwPZWfpbgg5/4A1SqyC9sMOIGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On 10/16/26 1:17 PM, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

-> "0x1 0x00000000" so that 0xffffffff is also a valid addr
(off-by-one)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
