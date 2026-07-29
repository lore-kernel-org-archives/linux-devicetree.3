Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875E470127
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323521; cv=none; b=NEkBDixs39ZApA9WOXWYA0xtcU9b/D/mwBxLoLG1UKIj3iOftRg2c1UFId1XSF9zMBYE6YGoGMqLqo7OVcSFWxiChp3HIB4Mbz8M6EBfXetg4y0Mtco+VI/NCyw0A6O+cGb5RaQC58igKlkFfC2bxOaHke22GlCo5ubRsZivGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323521; c=relaxed/simple;
	bh=F5TkoHP4ysYrGn2T9rCEX81ikt+BoCO5ZCcN6FhUTjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtIBtVYmA9V9eoSPfYC4L9SzjqpzgFolrn1z8dTWD/iDvP845bBkbDY7lAbYUYmGmAN73XDrcD+wlxUt+anDPDnFq7bgPBExQSL69OGi/FpCij7FFcv3ChQ6W7gfgxuPSwWmcUoNhcdL62xwmrTCG05JyOgpxILAcHtFmYd49uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frZl6kav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECkYNNgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frZl6kav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECkYNNgS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB7HVf1788353
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=; b=frZl6kavX/PdVO/u
	8S2CcwVNHu4hYa5dcnAxzX+fJjOGNzw9ZKUdHlVdnBBjnmcUMYoS5S/RmBAMVgdb
	1tM2PEYv/SW/O4q18dl0BPObhKIccUZHOPCqsS2THjTpKloL/YY3VTaEp+kuUdNv
	SizF4LnEUSmacJeMZbOsYgbwmRmk1hjpyyb8C5PHaMl03ZwNtAHZPFy6HbyryuoR
	HNOKVRXrfu675+MeUqMvD4/cxn1GdKe4HpQBY9oG+a6UBx4P+BBxWLrePF/cyYnD
	NtscfJ9oWQS0ZawY2cxmUuO+lqoWdU83Dw/cUxMrdA2fePp5P5GV/7BAuiHEHPak
	2B4qdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa331nwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:11:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso14236085a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323517; x=1785928317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=;
        b=ECkYNNgS3ztTBGyfsUnrUD7I3ufvK9yIjzvZVUwlryl4q9q3BD5OhzSW2aNgZRUE5b
         hwmJfJJ9wIJf2baT28VTdpj038AUyW0Tn0E2m+pkCBfDbjD5SHB4/VyNyyapzyCZePgX
         FPfdmKmcUmJk/zEqELll+YU+eP5P5WGLtjDfILksYzr/Pa8PFjsQLjolNZoHu6CR7ORb
         H6/hx4XsgIS36QXjtzxQuRZpCta+oy8IXxADk/C9vKNBKBDvCpinMhKcauN4GQZVQRq/
         DmTjXyB3hsiSYeWpXo8OoIQTLpuaZKo2Gd9oWOWkUjv0KewTM2UFG6FVO3ij8EGbt6sU
         cuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323517; x=1785928317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fggnl1LDAh6PfDukmLgSUqpHpgc1JT1Q+oz06t1ZUfM=;
        b=jnU0E9+JxarVEvrYzNd88wIwYvmeD0IyfoPaxYcyQDnPEmq79F1krW4BFg/Bo7jH1x
         ndhrq+KcXnPlvrLXIY7+iW7bEd6oGTaiTKLICeCOwv8nbwRBttVqzq4VDPlV0rOGbWp/
         JbmOKpqjwaK9r6xolSZct72f+hfkVR6aFWST+rh6pUw8zvln1oQ+T1vAyQsfTx7n+lZQ
         pg0h3j1zAuumPbJ9QnYcsCRA9dwut2U/ItuFa2nVJY/PuCxvB3AhA1sAwADgkhtz8zoa
         AmEY6soxWX+vUV/DHqPUQJpzXIE5k0DenAP8RN49HRste5341psqrWDAGpti58C3eX1p
         0Okw==
X-Forwarded-Encrypted: i=1; AHgh+RpdMmNgeoCEvgCuJli8NVUti1TgTU9Sj5bCbuygZwLXdKyZ95bctovhyu93si85nruxAyeDo0BjtMTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Hq/tbS0zLnPx6GsIrqx4UTQLZKfaNTpzJnDnRpclJMK8A2JD
	ZXJVWgPQQZboJi2vm3ZHUEW9FtauXXJFpCMMUIIwU6Bs5JbLrJY/tj3TQwgWky/lLMppgNz/7sG
	6kU5q1+40bMRxEbmgBViCHyElZ4fSC1h9ztWNT5dF+mjGIZSzUKeqsgNn6NNdcX3N
X-Gm-Gg: AR+sD12Zeai4QItHJytzuWeIBPTLDtxq6wBpldZX+aXJCLGeSZecbRsPUAsnLhnoFkX
	lI0xOL5iUoap9Qr1KSPftwGmXsezMN9DZmXdo8q8T9etmLG+ipbb7TPeFQNIsrDHXUvdiMb9H6/
	YlopqJJOX/WAzOj6ctHzFBdQCUCpul46WsRiHxLEki1mE6TInWToFDfjZP4IuPm/+MXQZ/jatDg
	YQjVmATZomj7feyIU04TpXcXO7ZZu0qFp8WJCZitxuz+7VAlTVpBhacDn4kVaEZp5A7RUWa8LiS
	2Lz3Zah3EY5KYA7rojVB58JjWljgdNDHQScBnBKOKR82y0jtl2Bt5nDGHWpqq0SFOMCeFSfgqQT
	CN+tJksjN5mV+j8QZhPOZIacD
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr53202571cf.5.1785323517437;
        Wed, 29 Jul 2026 04:11:57 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr53202011cf.5.1785323516876;
        Wed, 29 Jul 2026 04:11:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cde4dbsm101887966b.15.2026.07.29.04.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:11:56 -0700 (PDT)
Message-ID: <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:11:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXwL8nCyFM+LFG
 CMzJ+0JEhU3C+kuAWXYzPQDmf+/lXt5Ps3XUCsq5R0/sHea769ePAE8eK8oSPV/433BZ94cqj6v
 InSLi7WUJJTnfTjRld/moza/YjLSa07Ks77R8w16c3MfPo44lpF1DFzkBUu74NhX/HN4OtQi748
 TCtlpXZQtXq+kBLcloADVO7vkKUtnI9j0bwQwJ0pah/rdfG1HQ/sfEJybrZicRZ+CCt2ZJgjpg4
 6zNNV5ZRNcBnRa/EjsNJP+/U7asU2fJW9mrF7S73KADG93vz0KWXkqmVyfUPoPrF8v+dnC2eGKQ
 vpBNwRdCcNLQe/EV12ZCar6mAz7TU00B+fOgGnwrURK9Iwq2SIQq1/8ZxcI71FarwefgXENriwJ
 cTlZCMX0hksmUlgeYW8l5FHkrgX9R62KJdaxV7IXM1CemPi64xxT22piAukTmBoivtxlRAUtg7L
 ZuMLQCGL+LZTeBPtljg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX49Xn/0sft03Z
 RazPid4mpt7sp1gJeiV4tMM7oNKbrs1n6bpNXv66VojIkZnvIp4cc/YeLiPycoXkH3GpCh5N3PA
 3qKvszERfPs2rPMqcNqQVhgJ5SgqJUM=
X-Proofpoint-ORIG-GUID: CPWLYYp3ooKjKkTJJDIb0VPI9G-eHK4-
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69dffe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=czGEQ3qvJAC79WJ7zqIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CPWLYYp3ooKjKkTJJDIb0VPI9G-eHK4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> The EC firmware NACKs the bus instead of clock-stretching while it is
> busy servicing internal work (e.g. right after boot, when it is also
> emitting a burst of SCI events). A transfer issued in that window fails
> with -ENXIO even though the EC is otherwise healthy.
> 
> This isn't visible with the smbus-only command set used previously; it
> surfaced while stress-testing the new fan LUT command on Hamoa, which
> issues raw i2c_transfer() calls more aggressively and is thus more
> likely to land in the NACK window right after boot or during an SCI
> event burst.
> 
> Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
> a short delay when the EC NACKs the transfer, before giving up.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

>  enum qcom_ec_sci_events {
>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>  	EC_FAN2_STATUS_CHANGE_EVT,
> @@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
>  	msg.buf[0] = cmd;
>  	memcpy(&msg.buf[1], data, len);
>  
> -	ret = i2c_transfer(ec->client->adapter, &msg, 1);
> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
> +		ret = i2c_transfer(ec->client->adapter, &msg, 1);
> +		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);

Please break this monster up. I know it already exists in-tree, but
since you're moving it around, we might as well.

Konrad
