Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507678;
	b=UT+dMID2Od5ZUAgjwqlLwYimYKBhoS+puNtWaX+Zd+Z4cPzblxwB6ZWEdGoF8NqqfTlm
	 7bSfnV1X+9a+BFcm5S1gEzFd26pb0zGj3026poN5W+XLLgG0tYvYWcaJ2K1nkNM8x6q3c
	 //f00a4Zms5lzAA7dJEuMNCwngNBpdzu4rbf0i7tgJEYhGX/X3+YTNjN8s/WWIt7LSPV6
	 ffafMF4buBVi42j/upgy5ohcP31qORXE+P3UavdEDTlkWWRvUj8vsvucxEHNtSVhO2RN8
	 T97aeBy6HtW6xEkBSz1fqfz6kOxhkiF1DkNlD8dM0ZjqvOmC48mJDoVYHAwqvqcehrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
	b=KQKpqvtx0EQQjVSm5n6GU7EJL64uUiz66l5kGQstaRe37a1xHvwy4QEyBkVNRyo+ClbQ
	 uRYT8CXfLBZweLI8oC9uYeTEtiHvtgW+xgGOnwBnWSorXI+KbpNC/wFycOV2fxSu9vuTQ
	 /WJNvBeuPIh6HTubX+715QHLpLHiknpPGK7lJ8ZqbiSY51c5BjgooPirrrdFFB4qZdM74
	 YVFCCA2gLe4YWzF+IZjFzsuM3pymoBfEGeSslwqgW+uwJxbDSB7rosV1O99IckxJftB2c
	 4soGF3Heepa/Ct0EJlZmVS77k5Yi36svKLL/vmnkhmjyZe4rbYcLr9xrGZeFzcXS4Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85324606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85324606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kDTv197024
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=; b=HLMGCQ7qLSGC+CT7
	y3fCqbZTy3Hy7+rV0pTyyNja6XcXe5eljYzos8gItlAtsNnoRS6OBIiOhV1L75DQ
	EQa8KCz+nH1w7JNCqB7VVo71xpgqMX7Ru7Kvab7xDVWGdqdikObqIM/WPgb6nXjk
	QHXunjwoEzz4FtrahC20fEFUGLX+b39e17WnAqTCm2/36DwCiUuDgWZn88rirlyh
	Ym8fCz24R/4E7PqsprfTDpY7VZ+Ar1MN3Zc1lbGJMCIa1pcVPr/vbN+t0bIxjuhK
	Feh/6NvPkhwPgD3pRm/FIzjcsqwYqMcsNFSYbTWh5w8L9YSu2wL/XJPKeAEhEuSN
	oxdSpQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrah1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:07:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso4061673a91.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507677; x=1796112477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=TahY9ZXDLYi8ptClYdysF51135EDa+hz+KYLpXODZx1x6X7z75AWzy4Gfg5mMxLWrf
         M49QHQ5yvSE+Mx7IZZktzZTeCqBJd41izDPx3gtwJ4oG/SOqyk9git17UbqmsKM1DCG8
         xG0B8N7EKorhP3F9xD3psMCDq5A5DuI3QJzTLvf01QNY9+4rf+dj5j1GvI+d+xmVcfEx
         TTavpVslLvD/gEa7pb88MEc2farTDHt7Rm9K1KIA+k785r3qf4+8+YS6XnBJDclVTHl4
         1VoNd1vDTD497jM9Ox7zjyxuYBzlCN4eIlXcpr7C4IBn3khP5ndirxDSVcihsusrvJuv
         jcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507677; x=1796112477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=NAYHWeIpXoIoHQEbS9VeBp/E5TBC+p48U11bcS91hVNLtqOGnmgosAJempCXuQG131
         kPDYhdlXGarvnl9vzwzwqJCEbX8iXY7Yfd3CufE/fuAaUKhWa7e/2rESS7wF04AeqTkU
         QZXCaPRdDyprprVzarOxMUDSPBG3+tgJyoFV7BXnpDBXCex7mhJ7MwgHq0JfrFLb8ZdN
         +COnM7YfvoWo9xbVOEtKRtDEHiMzwBNfsyj8TKbHNUs6e/28P8A4WhNM37fQgkRUEpJe
         301hg/5b+5M0RS/uOWmgicPOyNr+WmOaNikMXgbLWsIFdiNLOCITA1rCOVEGR1WkHc6c
         CWdg==
X-Forwarded-Encrypted: i=1; AL+hErH01S38k+aUrdAdWGiuc+z1mjWfZoERm1nsO9Bj8eAN2HJ8PXfdtDVCXGIbcYIu5vjGSx249EM+jTwm@vger.kernel.org
X-Gm-Message-State: APuU4Z/O5XjKy4LtzrhJ9HHDW7l0QtW4k13zULP7U2CFd/vHpmlEXm53
	1MtVfra840gAaBp7hWmM/xg3IQMaITc4AMgiINyDAyTQD0uhkByK6KoNbEPqicOomPlTuNGrnMc
	EFzGENDOyNiSVkdZ3GWj73+cKDA82sRa3gOzTqzi3X3MAlRNb5sGq/Xkf8QDKNU/n
X-Gm-Gg: AZFdTZc/rhg0vfmvSzF3MMbDYQRaoz5MyztksBYhJ9a89S6YWnocHLlZEp/KXGl/6hj
	Um+DZw4CMxaXn2e8qO5IkIX683yakgQPsC/+NBVLS34EB0Gg3a0wG3Bga526bM9egi95A200Prl
	XWmxVftqRRgJ5KuB+Rpx1zKnUtZB90DvTKW4+cV6ro7ehmoIDimJyiAtjFgNXswDr27Qn66aM3t
	yd3XGegCFgSpTfBCMXI+z+aeiCJQH2RxuBO5ni9xAHLwC4ZvoKz+GDLcP1KtHa8YxQSgNqp/pOT
	amxFn/dKH/9mUos5WaKxmfyEotqP7fIrqmdD7G+yfKQvsiqgtyUhoto20CYOPi5qMRR1IU9Cysb
	UXCWseTaymfo21FFkO7HZSHnGa53ygN4eL9L+fklQv0UJ0+widNWbxE4jufrh8WJEDw2EM44dfO
	PBVA==
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197136a91.5.1795507677054;
        Tue, 24 Nov 2026 00:07:57 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197107a91.5.1795507676577;
        Tue, 24 Nov 2026 00:07:56 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm6563865a12.19.2026.11.24.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:07:55 -0800 (PST)
Message-ID: <d4e405ee-0e3b-453d-93df-dc216bdf6852@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:37:49 +0530
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
Subject: Re: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
 <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX/C1vqlfu+BzB
 6rYvA/IAZzn36wtjEYtqC1vOqTKxhNIOTJMCVBQM+irRsnngXP79WodaZiE/iDr4xZGTW2khDtl
 wtJHdPe5CSXFVILuCx7it27BvNVMAPg=
X-Proofpoint-ORIG-GUID: e38xztqdnA5lLz4DEwFxvJgWKSXoSKdx
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0545dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=2fnjfD3pYKcczP1kFF8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXwEjsIuVGZ0QU
 hBy955yp6LOa6z5QL75dyJRmeu+5QYY4IpSQQKbjPtSpUdk8BeFl0MQMBynC7R/R7NFbsGP064G
 mf9a35JsbAnSQtKYELdAnJ3qJtx9GAmLFyywJ/yFdpmdzgxfiKH/35G4l9hobO3eV+yvyt7bNNS
 qNJOiZFqNZi2RfZofvrAwB2VKwS2ZmgjZypi07s43pNVjFAYa2PCvldYIqQN8YnzrI6CL3OmHte
 EgfS0PSauHmf7CwWfr8x/Y6wkJpXFsSsOBbVZH0UY1qxXWN059SFzHQQaQSaWZdmbkKy/mqn9cw
 sNXnmwL+axkI2xU00DDSWa7xgbxHN1poaiIvNjD8ycyH0lKFoW5aU4dXfwQMYmou5mwTFfMo6jV
 el7RIGJBJfU8EO+g4eNAGMFNmzq7/iNEGlqkqixspk6+n6CbOFS7qbWLYjrln8t0Jq7nWaW++Fp
 h2s7QTOnuR0weKk34XQ==
X-Proofpoint-GUID: e38xztqdnA5lLz4DEwFxvJgWKSXoSKdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032

Hi Mark,

On 11/14/2026 4:06 AM, Mark Brown wrote:
>> Some consumers rapidly toggle a regulator off and back on, e.g. a
>> driver that disables its supply on -EPROBE_DEFER and re-enables it on
>> the next probe attempt. Sending the disable to RPMh immediately causes
>> needless power cycling of the rail.
> 
> Looking at the code here this doesn't really seem at all driver specific
> - we could implement this in the core around any disable and enable
> operation.  Is there anything that really ties this to the driver code,
> or could it be factored out and available to everything?
> 

I think you're right, looking at all the comments now, it makes more sense
to implement this in the core than in the driver alone and there is nothing
tying it to our RPMh regulator driver specifically. I'll make the
changes to implement this feature in the core in the next patch series.

Thanks,
Jishnu

> There's also a bunch of stuff from Sashiko a lot of which looks valid
> but I didn't check it carefully.
> 
>> + * @lock:			Serializes disable() against the teardown
>> + *				action, since both make a read-then-act decision
>> + *				on @debounce_delay that must be atomic to avoid
>> + *				queuing @delayed_off_work after teardown has
>> + *				swept it.  enable() needs no lock: its only
>> + *				shared-state access is cancel_delayed_work_sync(),
>> + *				which already serializes against
>> + *				@delayed_off_work.  @enabled and @rdev are also
