Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503664;
	b=27PK8UrDZtp7LasKnrcRC4zQasjbwcqD4pwwl15aPOwlMr230KgFHrhyPlWQAPoXFKUj
	 9bWAFi3WKbNwYO3WYTia/qycqRvkEWkYq3vWIN0y8nrvhXbdlg8lsxwXJFyYUoa6rmVHq
	 MDPCK7fnpZ1RiS5XhiCw0pWXcrPAvIWDm5QJJikJR8lgTXCiQiSrOrI9ehrLE7C0zFf77
	 jkiPiL0HLzKEU7QezgJqoxAqFqyqVX5UJkr1uQGR/5hQfPhSpKhpQMidY07hAno0ATlQp
	 +rshZyoZsxJzL0lfwSbdULhbNxGpraEOc6zFR2/6jCWceUSo3WTFlZxZd+0BDwyG/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
	b=scTQQx9zLiy52IQmGXDkufX8dSW09rn8IPeKqo/HKAtkoJBKZJaSejwmRNiojsssOJX1
	 R37Hv+dpMJl1THSNLawRhpWsuSUhveMBWM+Un68Z2wfXlHFOO8M32SNINyggcXBtcmGWv
	 zS5UmIe7zxM8WA8o09avWv87jrkrM5EcHDNLti/5cvachjQt814GiSr+5QzYpQYJ+9+iC
	 G/Nsdjxl1KRH+GCjY6CJejGxIsLil2Vii5qWlj2q42wmwMg9BKHxeS2Z6sx8UQ+bTst5v
	 HUWS95vcpJVp80S4Rjcnu83GM1MgnO70WxM8UA9jUjgTpagTjFb7zbucWJ13KdirOnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fq7PrJVF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71688606A32E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71688606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fq7PrJVF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAH8a1209933
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=; b=eHAxwnQsXXCfP4yr
	Q096nr2TbnJ/fgyB8Pb1zZfzWKCgzShCqiS8WNHps6n+3+0d/p9dkcIDao0yZzsh
	jpja2Mmw5oFAD2PmFtlolgE4o1ovxx4BcXKBsaTnrIGVc903aNetY8/NXg7B85CF
	OlF5Tz01ZgUzURPvLLyGEozF7XRjN+WQFF17ZLDshpjyYB+/sT8zBDxzyO3ryE6K
	4AZsrE5ixjTtGFRBxyl9+nusA+g6dV1Gt9eo1DFYaL+F/2BfmGnH5s+FMGTkiIjq
	tta9h3TuPBrWnddHG9wwJKRZeP9xe+abSOdEzmDRmUX5d+Oht/ZLQso+KjkIEaMi
	xFJOfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5paqdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635fe2335so4519111cf.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503663; x=1793108463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=Fq7PrJVFFiwawF9QZtSQfuETvifeHkaoIi+S4Ehm+F8vD7yo9oj0J7ZTvDeflipte8
         bLKZ1EXf4HkmsLjdEQpQ3+r50GB6tzXOMnaRw0G1f10r/nYUachLqZPIkM1BTuIATfF0
         Pdb8DbT3g5xcYGx3Fb3cG+821bYbvb9OinrjmoUIvUXWI4vIY8P65+QNW1IinlyDyqn8
         AY0Xjd4GiV1ISFwsqyQxvpKadL1KHTvFFrkDqHvP9Qe2HpVJf42qr5xg5cfoPWAFDDvE
         pcNd8D5DSrZrvUzZ9CsMxBWAkTP5GmqFkQb6Qfxeig9aCowdiE9b/Cf04euX8d9GGb/W
         hR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503663; x=1793108463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=cCKIWUbdARBoDH71wC5bllGoy5uiBfdsi1e/drDFHylYkwiF7eo68T836dLtmnSvK7
         ol9KoadYyggXrns+jRm4ATdZThVbkbmXUlRRMOU+539WnCpxGrYjPNInugl2QRy1DU+k
         a8epFxEO0sM0kBmc4GbPIZ3h6Hnqe4JE5YSMLhoKcvWr3wqq2XxQKQPn0mcsQ/8h9AD3
         ykBAmXQ0j0D7+dtAAWScO1N0bOxNjr18NDAdD99S4pygt/JNRljhRvPZh9zOcGTEGJkv
         zIK+JoImOvGs03E/jFpCZuXdu5KqEv9bo2HjNHtvthglYZDSoALGa+kzWxczP4Tqn/AH
         nWFg==
X-Forwarded-Encrypted: i=1; AKwUvBzKfy5i6o8ztQ7QokyRL4ASyiX+UCVww1xUhWSRU6iFgArW3iTyvvkOOihx7xvmnlBJ+IlvJNCIOBXX@vger.kernel.org
X-Gm-Message-State: AFq9FYKjednEbnB0iyU/r9wbKc2zzfpf9zReaYvA3slGuFPeimH1PCBh
	rUHhFNqSlefk2OdYQqVBl16HmyDJM2ulm3unKpS2sLV1qYujHQAqF4dto9gh790ZeGV8kFfqY9a
	ub9mwjhRZFMn1qHuQZN7L28ejJ42CGQ23lj7iOTbRF+HM9e5jwgsCXzOSCwe9b6Y1
X-Gm-Gg: AYBFou0LbHrnHGSWN5hbP5QdqKazOe7O/7NRX7PNcODI9vEOXCgm9yoMLamDac6yRew
	fLChgROSgYpPebwv5yRCNuqOnl6kx9z+PJdfmEq1NwKDmCFwmTRBWSINUmmlRrAF+AGpC9YD7ML
	XqwcWJBh0UHZ0RiFqywqyjp6QZ1mPni2drRM7GanF8yUes2EQSMRVbrZ7tRnVXsRVrlPpgZCaLO
	JE+SHpRSfjjA7iL0FZlejEppJ0S0FzvPZTeebSMiCM6yjXOJGMZr5CohXpUKI2UTyKLrAodnf0i
	rjMD86GmoTMlp+uZiYS1nnGSYB6g13I5uZtxJDyMgIr67mrClUHkGjtfS4zNB/6Gt4ih+602MlP
	gQMuDH4DyjknGMfHy4zOEgw==
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204967361cf.0.1792503662626;
        Tue, 20 Oct 2026 06:41:02 -0700 (PDT)
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204966841cf.0.1792503662173;
        Tue, 20 Oct 2026 06:41:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm487237566b.27.2026.10.20.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:41:01 -0700 (PDT)
Message-ID: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:58 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -wcz5ap4wMg4K3JqNMDjJYiUJLLI1qRX
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad76f6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZZu2SShvvRyxSvgSXh0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXygOR0+iHwfSu
 piELJeHXMaFiv864PtoM2HWt6wdS6MNfoGrEMtxrWuPoBGa5O3Iuec9o6Nmq7J5+ITMC/eifHp9
 1tFlr81JPsvFbkO0X5JIfH72EYoAHe/4GlyUBDfxiktum5OT6AbTkkJre2eB02HahYzKW2/tRYv
 Cx1grMdTq/inzRM5+U7wmOuc8YTAQcr3mlQJzkBA02ZLqdt6e/Y4r8s3ABhhHANwM7q0Z4sEHAp
 sbCeGDypILbZslhVy8VolO2qfqc8H8ZAhUkg871T95txdknEYmH/Usm5WDdUHVtelMgTJE0iUEG
 cmpkJGrNER0XM9+6ZnyxPutXNSaIzLRThqnmcvwA5tQBB05Nlyq7i+EJWxW4sxGk/eodYy56zW5
 XmdTFaJBYpAySWf19viN+Ia7bYeccQGb3MRZUbRDJEbwWoqYDfJfiFUSqnZBbV7aEUyYRU9qNOn
 QO6BdAvEDUeloW8Axmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXyH7mkMimWLmM
 63S/ChUJUOmeFYn3mv+k7npF32ARCsRWth88Y+jijA4Svqi24x73o+6gDfZPv0cnIICxfH77Dc3
 lv4c4C9+vWOfl56Tvb7NGizO27g6peY=
X-Proofpoint-ORIG-GUID: -wcz5ap4wMg4K3JqNMDjJYiUJLLI1qRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/20/26 3:08 PM, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
