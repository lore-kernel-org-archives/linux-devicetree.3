Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E998430CE2
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579745; cv=none; b=jgtMGhnSoR1jJzV94bcQfeMHCGYEgNEo9AQWUi5EJ33M+03jGpUreZS4RibFCK7ZNB0kEu40WdB3nJ3b2caBVJ4GuFG3qyfMq8jlcWWS8FRJ1hCvXqK/AHO0kzqlRbyc2H1D0VNaBtUGVCVSpzGRTP36n6LcEzOUd8ELx+z+dC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579745; c=relaxed/simple;
	bh=+qv+TfTQ75E9D5fgJmcO2yIFIeUhqe9JoXKjHwH7ycU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVtdmxt8iybDkqQyeFojl6SZ44tCnbY5e2ajWjR+hrpj4cugXqgih3hcGFb3eHzMa/6W0DjSTYaWx2i9rkr6dRdDZ9IGNZXvTrQh+hfEGdQ6MYiRvno8e6ve1PuGfH9eSaK5RELsvxks2CMOq/R7PeKgxkpilqPNZQNsvFHQDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4HFcVB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwHXzKfK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4HFcVB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwHXzKfK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuwJl3053511
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=; b=O4HFcVB5Ki9Y0e2L
	zFUg+GbkeUJyHkdWRqQ4OYeFP5Bl3Dt4L0RPUf5Llck55to3FvwdI3ouBobTTRC5
	RAH7rK57OtdJVZvhME6Pgp3Ol9qUR+3yPO7l7ObErQz0zL8FsqiqM4eQfr6sr2v6
	P96rss27FQb2hY9e96z+YtMSGjqIMCp8EKVJlpDqgqJC+GX9VNp5WsViivuiVb4u
	NSZzomdZB0B0JIBFF87MIna92h03om4MzWMnvFz4nREhyX0bJsCnxk+/A2dmHaQr
	SlchcGm3gD4pyAAcJcToGhEb49SzWS556fC6ksXtq2BXzaluPQ1bf1Wnzzgo91j6
	iD9GUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7k31v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:55:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6850941cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579743; x=1788184543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=PwHXzKfKVKoYQ4qRd3++Qb+OgnTaACrf1DAJP4i2gieS3kOE47f3dzPh2+ZDhJDF0/
         kC31PTsyPOLw86u59LpkDnWhnjOB1LX4TgYaGYX6pqkZwDQ+vHg4cjn6OKSaw4UnsizV
         75+/S9yn+hooTyJU7lUPV0pwzY/x0zmgx7KPdZRyZm7dpu74szQ9Piacv6s7fKcTCdjq
         C85Gy8rgVv5a1h104vr6IlKrgxPmkF2PZIAbYkFEH/JOWGnjBJGy1zIq8Uo10sbEy8zk
         L95Hlpm6X6rXLPbgOXvUwdcAyFiMGbP2NBK/zS9KNcFrcaDgNrMtaCWdKvDgUAgjr6Td
         5pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579743; x=1788184543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vKvlY9zO084BxrPIXz1eIL0GyObbx+k7Y4xSBncVB0=;
        b=jzfdOZDBfso3nf6YQ2SyHjW2RdH4aCVgR/IVOOBLE4SzVX7Bg1zElSQEQBjjNaZak5
         xPIDdUtp0LKCiZtrE9aTsCBn72F37AMA/DcX0Llk4rcsO+zgqjStONBomInG92Fs0sz3
         8gi0JPMlFHCI6ee772RqdU9iwhJEl6hnKV5aCPgmnA73CWCR9Ni+20jfWVths4Lkaty+
         ZGrMpKgMOwelJ6yDOF8eOGC3W8YZZ+CMRWqUDTsyc+kGfNKrKwcjgUsrbxNCEwyEEkwR
         SSn9WoXZN8Udc5Pa1MoOa+kvkFHpcxd5MQ8n9yYQO8SFjH/JZJlvWJYmuztfJ9sNY/kk
         DLnw==
X-Forwarded-Encrypted: i=1; AHgh+RomlukhN+3qs4Mo0d6by5yxLZ1cZ1clzDoSNVImqXbYP0Oe7Vz/0yFdTSBv3o7AmMxOdcngE6g9HQ6z@vger.kernel.org
X-Gm-Message-State: AFuF++mZsOL42TV1Z028svXpH1Tmrd9eoD6mB/LooXe6sT5CJtLmjjcz
	MmUdtTBzlLmIQpvUyyBIxh9QzywvxbHW4keBr5SzIjr6UOknFQGDM56N9xior1eLj+9Q+WGH//A
	HYPhC2oAiMZdz5LnMGRQfeN4f/jafpM6CPSwIkfq0V3GPzPTzaaLLRpqL1IMcX4fN
X-Gm-Gg: AR+sD1236eeZucnMTSnu+AnXWUAXKGvgFo1zvWL2nq95Vp0Qcqc3bheNv1F1xvPNTLK
	yAF4TA7hfFiRPx0w2bja/9JqNtJDcyUIWxsjaXlV7I9yvY2n26/T1m1MNjuHtOxFQvEPqxXAJK5
	gxhJ3tVqt2ugAX/IikD2gXKlS0odbY7NUN3YAjDcfzOjO7IvfgfYru48IE8iWRIG15yShHrlQCe
	KUamNX/5CkOp3K7AxCRKdAj/FRi9qZ3pIPk3f/sCKKpUtOshBZ9RDOpoHv3FfvF5N42088BxAFd
	ZXHE8C1RNOVB4ytzhKBVITFkv4Gx1KSPeF1u+65cwTcckxGqdGEo3+99eatPh4ClXPPj/5CpmUk
	cRx6l6iYJcIf+Ffr1KVIUMvC1
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196841441cf.2.1787579742646;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr196840801cf.2.1787579742115;
        Mon, 24 Aug 2026 06:55:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968665e0sm1141632366b.53.2026.08.24.06.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:55:41 -0700 (PDT)
Message-ID: <93960f67-760b-4667-bf6b-c99b021263c0@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:55:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for
 Nord SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-nords_emac_apb_clk-v1-2-290767386bf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c4d5f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ybGuUY0XYtVVdYjWugUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXwyr3YouMlIsO
 ekKtRvTaREbV4hDj8MuWwZzzJ5tPhQV8/4VJo4VL2D5mQIMX573BusmSbMZPCfjyC9pzEoYyGln
 FGUJTf41d6NCtz5wzyLGmxHjAA3WnZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX2R3uuz4GATN1
 kZiUmNROwVvHNsVxTVKPO8LElmRlEcmCOVVWldTP9tpYVm248VIrJCnEJ825MxmjRRCbZ0M8b6r
 03I1JkBzASvVlon92TLiXPtQPX6eMkj0LqkZoLQjo7/HuuqBdH/GbOxNGBrFYWK8nZlE7UOC456
 Hs6ISM4RkEOZuK9LszmEdMMSjPKMVYHn+Txu8tKdyypdRnJOpWaaeihshDdSACzrxbzyAR70G6C
 nqV3KtGYAGFXCl8kBlkuX/M8cnB82xZeHe1ebrEngXwtUZkeiBcdzXH7kxPQZR170fzG8+/g8fk
 h3h6MlXX8wJwqcupabrfuU79QGC4ksGzmiPvAFmag8GPBIgy1JFDqdt8ThPEogpzGHyZN5C7eDM
 ZJ1woXlUEZGyCD1zRdkIYdNd0OAArEuLdUY9mB8gqS3iMHniOSIhnZ63yS6qNE3uF46vbzl6jTP
 pCbS8sy2M7gjreHZoMg==
X-Proofpoint-ORIG-GUID: gP1Ve1MfZ123hQqmi9U1Ga06dJ8nXPPS
X-Proofpoint-GUID: gP1Ve1MfZ123hQqmi9U1Ga06dJ8nXPPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116

On 8/24/26 8:53 AM, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clocks to the SE_GCC clock controller
> on the Qualcomm Nord SoC. These branch clocks gate the config NoC APB
> access to the two EMAC controllers and are required for register access
> to the Ethernet MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
