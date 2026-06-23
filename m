Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A48369999
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208562; cv=none; b=q9eOoWCE1QKr8sbIfAjZjib7rzyeOvHdhU2Ftut7fMZ9JHf7s77DQEBlLxrUidHo/Ap5GMtLwfV8rXdr41xV58zk3n5upxVHLvWV2O/UwZPrzZEyOS7jktxTCaN8zNMyhqPhnwv5DrPGzgTZFSs1VAwtRTW+KasJXTFY9ZqKvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208562; c=relaxed/simple;
	bh=TuuVh5rWDQJNKeCix9U0TUROxQoIHHTcGQZRv4sVMRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAyFV3xYm9YXTxaLZffaAwKZAIdUA6Z69+uy6s+JLJd2BOE929HRZ8kNoHkfTUxSvDCWnMQx+L69d4/j2FQjIcwrwo2YCidaulH58B2EjikxiqPnG7Zh44OE2YXVr5qohPPudmmCNpiKHUM6HT7EJfPL63r33tDVPgoBy+p5wPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9+CsQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DT5ACLIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy9+CsQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DT5ACLIn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ca4r2992145
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=; b=Hy9+CsQ1WtvXWdVT
	cTv26O88rGKF2e5vnsuAkoW9mBSoWzMtuF+0LVpShZzLYyxpc/LTvO8YhzmHvics
	SaW5wK/MfzoQBl3V3mbWnlvnhQWNhn5yEWdFAyISEJu+6mPjG5RJV+LAwkrtfWjI
	4PzCe2sbjgmJOaCkPcjA+YKBGwuZ+4KhW9tejZdzOGwv+AeHUT94RDlb0j79/B3Y
	Fio9GYRFl57e8NHG/AX4rvRU9XGF1XbhkS+uBVXwz2KVt4vQoRfCxWfO+6HH0Q2Q
	42I4pM9Eqi8VEfr0UlMh/EWAKHT+tQgSWfRvMRGbHfn/tGq7qSr6rpQV+ZWxW01Q
	LfVSVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729uu00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e06f4680bbso74231976d6.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208560; x=1782813360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=DT5ACLIn0c6+QKM5AhapbSQrqqfgKMMcsql+F+sFCkAhFagDPf+9ppU9BWprhSwbE8
         HHW/ABIbeh4mGeS+3m4k8muZWWChTdjcYffZhrOv+OM0DMwMlxqEKXKK52jbKej5991L
         MCVDyXSGc8byanMzhyuO383pYYxKOHZGeV3hpFjGkF+djDyxw/Q3jiB7snw3C3ls3opV
         AxQ3Y5WzNVjBaCYISUCTRlsXABP4q9KvbI5qRv6QB8RE8unWy/bWrNfNwJnOyi07fwv5
         WNalVybOF507WBVWaNH/hFa7joNOBJ086ieo0jnsdgEJpFni2hpmFhEiYwDvzWcVuu6r
         o0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208560; x=1782813360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=JjwIo9BjmOLYrG2u4/E9+wJNCoeu3BvPlsV94EYMXGEsGGHk+QCIkfv6Vxrrm0Ee3q
         uf055DYesuG6yAmWWdXqZr2VoEVAZr6WDgChlG4lSD4Mb1R1Hja0nhz8pZvGvLVNS7V5
         +AcA6f8dzMDclhd6Q7wfB4EYC6IwyHAklyp/Z40EdBQdUdVI808/svjaCcNpw6C7k+11
         UpWk2Gy3VZAeakSZN86Cofw1YAvph8vv6Ar/niE3F4MN9HxR16V/6Azqk4qzIGovFA2Q
         qy5NWOdhcw9F8qIDT33i6cQnwIRCPDmJ+cyecrMzmO0DjSoj9D8rrB9TtrcCO+paUk7+
         +p9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gb0v/NR8uldWPkvej20e1gWUejHLv66kxlIuefC+ZjmCoES1Jj0rf9qUl552MZHgISoYoTDJiPYRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8WXtcFnQCpUWav3WUyzpJNJwAnAxhjqAqC38bFSDlUlXWkKs
	mhIMhtohjP45kBAXChc+JtTGWSA5DDVgqy5ieJ5FA2remxPISv/tiV24jFCnOhefDpTWSnTzi8S
	YYEEWTaTYmwZMnYJFcfw8PVQdCkBITJaNggHLYj/VVAjFEx+HvcIjwVuQmMVh/CttmxkLmZuG
X-Gm-Gg: AfdE7cnOu/hc/eu1e7zFV1MPWP4KU3qNOYPZLPHgxFYBVuJsn/gRohS8Z6LF4x0K945
	kx+OK4upIzJzuCelEy5YqqZykj1g5puQ8kj8wnYWB9ovGfD896bDfr7s6/O2r7D7K7OnY8rCjb9
	YBBebFYNhjW7ATtw/NWtAdjvks1vGZu5Bs70CRlE/eeFJ/tQtU9fRPano6edUnrqvoj/hwug0DJ
	6pN+wIRDOCc484Myz5oQHzYCU4mVLDOBSdMMLaGZodYODMMeOeWkndD3pb6uH0TY+u0rcF7g+tM
	nmpCPwP8aelEi6OLYqem1vKOtEC58sJl0S9eZi4XTy4OB1JRCFr4jNyJrik782lm6XY7olC1Swq
	ntsP0bUQiKbT0qDyblfHuZdfX1qsHCPMafiheHjls
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502971cf.26.1782208560110;
        Tue, 23 Jun 2026 02:56:00 -0700 (PDT)
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502551cf.26.1782208559652;
        Tue, 23 Jun 2026 02:55:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm34473542f8f.31.2026.06.23.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:55:58 -0700 (PDT)
Message-ID: <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:55:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Jie Luo <jie.luo@oss.qualcomm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX0kfemwUfbWO9
 0Vm5xcX+VDBe8oD1M8oWQgMu7fyJcp2uzr7lZcapTabpT7GHm0DZ1/JLMqU2aR4CGGJvyAgj/kj
 40UU8iUXcFncCnMwTsgsJX9yMzyj+L8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX4FdGjpubhhyD
 ZolQ/bjPHHXMMVyi0bAEQ9gpiA7q6UG7mKX8gzimTNc8OcPN1gA8X+gihCAhw2pkk5t/ad9sZNJ
 Wewg370El4wk1Cne/7Avo/KbSJyIog0OaZZ2HLYI0Z1FRCOV9KdW/wI4ukdmn/wBuiTZVd5Yec7
 1svU9K9e/VhtmTEXiX2NXsrRFU5pwg3vxMVVc1bp9MfMcdyONgrH5wAsCnxqrGF7FrRtti8rLEH
 nqgxFkzx1+FIoa2SksAAIwfrb08qJ/L135eq/dilGx+a+oXtF20+ZsWS3YCqITPwK/VjQy7zVOt
 M9E+RBSGmAkkMF8G3vxPSHmaqy2Q9s2kjB7pqw9vU7IqZQJB0ohQYfWM8i6pk2o6WpbRxejyHXn
 Ycn6Sr78W1hppLAu9etiIXD6otYNVjTKlFU3SDbmylMvRCDGILz7Z9w7jdUhodBf927AwgcwQsR
 25U7kROsPSfBXh2Megw==
X-Proofpoint-ORIG-GUID: _9Q0sytzi58Hu2DsXVKd7LdUT5I_r3_n
X-Proofpoint-GUID: _9Q0sytzi58Hu2DsXVKd7LdUT5I_r3_n
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a5831 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UHseL_0MqL1Ls2T-heYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230080

On 23/06/2026 11:42, Jie Luo wrote:
> 
> 
> On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>>> Driver is not supported - in terms of how netdev understands supported
>>> commitment - if maintainer does not care to receive the patches for its
>>> code, so demote it to "maintained" to reflect true status.
>>
>> Maybe "Orphan" would be better, if the listed Maintainer is not doing
>> any Maintainer work?
>>
>> 	   Andrew	   
> 
> Hello Andrew, Krzysztof,
> I will continue to maintain the listed drivers, so their status can
> remain Supported.

Do you understand the commitment/meaning of supported in networking
subsystem? Do you commit to the time frames netdev is asking, including
running the tests and reporting results TWICE per day (minimum frequency
is ever 12 hours)?

If address did not work for half a year, I really doubt that you commit
to above.

Best regards,
Krzysztof
