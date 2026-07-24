Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA53A874F
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877717; cv=none; b=NG+eYgyXljOY3bmw7DO0ifnMOc6wF1oU7zD7LQDqV6AoQBk+oe2UD+4QHEkOYd3lwd7BTCqDtzdfYHAPeJqCmzT3OPU5W5s8S90mkwq/Tb6rO5YEOm2akjQ8RHCPtqeSk35c5xcD1fKSL4qnZtIAzu6N0cleQ4WCfbRsv/qVAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877717; c=relaxed/simple;
	bh=T/mVtXFpRV/KFXPYmh4hS6FwTGtXktfC7N93Cv5SD2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHM3NuyCOcfo/m50GS3JVStJK3ecFIgz0HR7XJtGCTxKu/PgRf4QYuu1gpg6NTnwiGijW/rpbvh0PNxo1XVW4aqTgB6YcmVDdQU9M0CXDtjmYbg7EXBJ/NpTR4Vp6MoTrq7Zocb7AQFmjZAxEJwcpKXWFlaLhQhhX0s7ZtKl0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv60xMcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXGzWGF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv60xMcP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXGzWGF1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLKQ1976909
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QujMsYqHj01uukt0+i1dXgGQeV+hHQ+bjAtReQvTWPY=; b=mv60xMcPc/yPiVMB
	lWzfNxLu27HTGiW6xzh5RqvZYYPcLvGF0wImFbJa/3cKvstTxr9SC2OkXlNdpSHv
	XZiPbI2Mxmejo3G0hi1PJQm12H6+OtD28pS62v58Sr7aNN1jUrwCEcWGshq45FvZ
	IC7w68FwJvY3cArxQ4uCY1+m35+trdu5qYsg/5agCuqzMBvNAgG0yKaXhEGAcpW2
	HwZ+pP1FTWpwGj2st5gU5Flflg+GIZaxANVUdtY8alSwC5sAbrOQ92e1Tk49uPfr
	LFDbGibRPvGgr6N6pBxcv9qGpZUn6npJAjl6VMqCQ//XOET5lSePLqAKjG3GpNpB
	Zu0aiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmkb4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:21:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so2483345ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877714; x=1785482514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QujMsYqHj01uukt0+i1dXgGQeV+hHQ+bjAtReQvTWPY=;
        b=IXGzWGF1Du8HrCzSm7mdDSmRGnbonClBLdOFBRiuXO2OUHftrYb43DL0U5vxOIq/xb
         OUWu0RTK3QhM31yS4JxHKchLw6UbCBpvtZ0p/7nnF+TEy8tWUPuAZJ7ls9UvsQqnRT/w
         h1BXIFsD6D5/z/YSxUTt7CdphOm/wtJpurIspdOJYVL+XuUSKVwcKT4NA3lN7jIp9otu
         /g1f32q8fUe5/GWbmOfAhP5Tu/jpDz15ld6MH2oC/HiwqNZgdFQUmdVplHkqIwiDzYMT
         y6LGCfRDdpeyEKBHOYAWujjqPo6BKopIuhBnF+vtGcz1e/52BKVRZ9Uw97WANw42XZNU
         sK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877714; x=1785482514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QujMsYqHj01uukt0+i1dXgGQeV+hHQ+bjAtReQvTWPY=;
        b=V1Y9VE3W0n05+K348ahqM4vqlUr7gPzenO+HwA2aSF5eRuF5g9gJTihXq8xw2P7DWY
         Ky1TzVsjXrcJa4gd4UW9kHAVHbKqTwSlbBPaj4g721byGJ1TIBIJYjxoTATRNlZWLKK3
         pam1LJr5vXnOPM4hayp/pvqtSOi/pwS4DNvanyTqqU7vPMD7H+onnD0FREODqmgeeT10
         2Uwe7p46SbZBfi6hgzo75glpmhKlVnbh72Xl0FyZGbwh9ERLjPpX3Zamx5gy66WYpcx4
         cniEXqEokcgEQstp3JZFq2tpNFYlWI4ut5rlQNDogreiL5hvgWi4AtPFpVwBGNRywiJA
         Pgjg==
X-Forwarded-Encrypted: i=1; AHgh+RqnnCoA0vg6/ziLSRDJ1WvfwTBHJkdonA4Qg4YOHqnAyJO4a6FfX1XaROJl+pyyuR+sOJzaQJmOAiC9@vger.kernel.org
X-Gm-Message-State: AOJu0YyEDFv0R1LqpCa+5GMq/MB7z9aDa8SsGbssYfIo5qJZJMHk1O0+
	sUIlzPvnckGFYJJKEDMGOFaDFYB9YCiofsvpMnmwcOBHdTFsnb3ezBIuOpBJ2P10OOSZqdW+6oS
	A6XJ3ByrEJbsEdHHCPFUUvUKAHg3WIdaBXGCldibNgIocv+VwM9zqEXDVbz+weFUW
X-Gm-Gg: AR+sD130DVCmcYiUooIN5sWwPIafdnTcdDHOIHfBQvvuS5qFgvqHuSJJcUpnruiW/fM
	2KMZqvnaVQqoWJ5sBeHMVO7yRLaU3So2Ff/vu3waBC0ANaTJBScfD3KzJ74KlbccggX4WIp0zpw
	dQBXLc5n8gFdtlvu/LIaLqd+c5MDv0C0cmodfgSOtRIYZIEXwWk4eTCXCECDBoxBngERDwbwNhX
	1huEK0SFhpGi4PK5Q4ge9UVOJhGjVpM2kWAhwDnuuqcOSqyH0LnNj5HcIizlifjWw/p/E+V51Ue
	h2AVjTYW1weLYRGyQ0RI3tyJnl97QdBlvSdufXY0D5rQOzSdYnf8e68PXkNKhJifGC+1yaO/sUU
	0p8+Skgu3DgZdzvWkcNq5T1VvVNYMCi0=
X-Received: by 2002:a17:903:2987:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2cfa9452b51mr64444775ad.9.1784877712152;
        Fri, 24 Jul 2026 00:21:52 -0700 (PDT)
X-Received: by 2002:a17:903:2987:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2cfa9452b51mr64444505ad.9.1784877711665;
        Fri, 24 Jul 2026 00:21:51 -0700 (PDT)
Received: from [10.217.252.136] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f39064bsm47642475ad.76.2026.07.24.00.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 00:21:51 -0700 (PDT)
Message-ID: <dffd2ba5-f02b-4d8d-9b6d-03acf1f6f205@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:51:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
 <vxyc3lgvofl3yrodrzgxh7dtw3aegdcy4bwn7nf6eivhz3ld64@i7romsdep7e7>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <vxyc3lgvofl3yrodrzgxh7dtw3aegdcy4bwn7nf6eivhz3ld64@i7romsdep7e7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a631293 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LlWMOfBPVhFVXrbsjUAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dNs4HsRloD9VzxC9mTVLvQURu5TsuwSk
X-Proofpoint-GUID: dNs4HsRloD9VzxC9mTVLvQURu5TsuwSk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX8zcDtLlUnHLF
 MkR5UXYv/zjtrFJGZ0JfEuAw0xCt1fkcRjR80sLSDPKcGp3iOPHNS3Qneh8dIN8+96NvLigxq60
 Z9Iq8Q78QigVyccqzcqZRVryYq32oJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfXzN4BbHw5n5re
 aMa2IN1mwnSv5Sca4OsmlYcD39ofKfjOmNOSVOukYcC+fJgZ4YaDgXWCnPtRY5saniylSocovO2
 9Lfy/BQgdVcPvpQtfLinDtDtOQ+uC8RtCit8rBP4eXDttYncCXkN5svwP5O0fLRJ2WE2cvspA3O
 2ti0lMSihQetn3HDsAmywcJ2eyyQzfm72L4wFupnOe8VO4ETSPeO1dmzpifeDwHNW8+S9QoOk1z
 EhjhzhOSAKwaRwL2rNYb9inbXdnkHfsEV3n1V/dvlmD7iIQZbAPd2UibDVdIxgZUWju4a2wP79m
 C4qKa8otnRbCm94PfmnSRJw7HoIrmf9xnLCaK/mRqRhJSH0xt9jKrVrar48EBjp9nS7r9qUE8iQ
 fpFPSPZ+6wyR8JchXyjnufrCF7XnFX82O/Ww/t4FD1d3g1AEe2YN7pMJi/+ne03E0BmaqHT+VOQ
 6q9ZbPAwaOvOrcArQmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065



On 24-07-2026 00:36, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 06:01:07PM +0530, Rahul Samana wrote:
>> Add QCC2072 as a supported Qualcomm Bluetooth controller.
>>
>> QCC2072 uses the ORN firmware and NVM naming scheme. Select the NVM file
>> and BCS calibration file using the controller board ID when available,
>> with fallback to the default files.
>>
>> Register the QCC2072 compatible with hci_qca and route it through the
>> same UART setup, speed switching and power-control paths as recent
>> Qualcomm Bluetooth controllers.
>>
>> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
>> ---
>>  drivers/bluetooth/btqca.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++-
>>  drivers/bluetooth/btqca.h   |  2 ++
>>  drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++
>>  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> I think you are a third engineer who submits a patch with this name and
> with no mentions of the previous work. Are you working in parallel with
> no idea what other team is doing, are you ignoring the previous work and
> implementing it from scratch or are you picking up a patch made by
> somebody else and killing the authorship / SoB tags?
> 
>
Hi Dmitry,

You are right, we should have called out the prior work explicitly.

This series is intended to continue the QCC2072 enablement work previously
posted by Vivek Sahu and Yepuri Siddu, not to replace it without
attribution.

Vivek posted the initial QCC2072 binding and driver support up to v5:

  https://lore.kernel.org/all/20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com/

The driver part had received review, while the binding side still had
open comments. Since Vivek was no longer available to continue the series,
the work was picked up by Siddu.

Siddu then posted a follow-up series for the reworked RB3 Gen 2 Industrial
BT-over-UART use case, adding the QCC2072 DT binding, extending the driver
support with NVM + BCS calibration handling, and adding a card-specific DT
overlay for the M.2 E-key slot populated with QCC2072:

  https://lore.kernel.org/all/20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com/
  https://lore.kernel.org/all/20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com/

That series used the older card-specific overlay approach and was also sent
as separate unthreaded patches. Based on the review feedback there, and
because the M.2 power sequencing work was being upstreamed, we decided to
carry the work forward as a new b4-managed series aligned with the M.2
power sequencing model.

The driver patch in this series is therefore based on the previous QCC2072
enablement work, with additional changes needed for our tested RB3 Gen 2
Industrial setup: board-id based NVM selection and combining the BCS
calibration TLV with the selected NVM before download.

I should have documented this lineage in the cover letter and preserved the
authorship / Co-developed-by / Signed-off-by tags appropriately. I will fix
that in v2 and make the provenance clear in both the cover letter and the
affected patches.

We will make sure to follow this through and address the review comments
properly in the next revisions.

Thanks for pointing this out.

Regards,
Rahul
