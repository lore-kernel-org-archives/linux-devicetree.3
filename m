Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979459;
	b=DqtgJpi00GeketRNRfNiFhVkocLS20q34aLgc4UIzyt6VSaWXxnCEdXaysIHViKbwnxo
	 VRpd8d7MhwOlxX+rEwchMKIKtFj7HiA/QOFhSZGg+SM611j7m183HiuX2KMCgnZPLrLlg
	 R2XOa4zi572yl36S/rmUC34FOj+vsKvv9OCIBypxcY6NBXY3MvTZpm0u4cZoWqZdylCly
	 iURNQsSC4PbjJgbYCJxleqvoyVCcNXXsVKyZiniou352EMU74uf191NJZS1ZWzQlSn3BT
	 0tLrhXzpXCd0y8YEZPUHguwiAtEp5p5YUkxVu8jMlzkZvZaD/ee2j00ysNLs/l6Clzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
	b=IVfUv5My64J8tzQptRG9OGcGb9I0IEpgNvi4Xe9JhMJSbZA2BDv8t5778zai3mzWBCFM
	 tGeTh304+nPplsSby3nAo4dDDmQAfipRdQYgu0gdNegsICkpw/suIWdm32g2siUjOx7Tz
	 HH5k3I23Zp6jgSF1KMipze/i16wJlhMKW2YQllqIz5wZj/kDYXIW4Qf6804/LiwBk+RHT
	 IByYuK+9RdcDVSuayGUiEnlvemqdWk/DEmnkrSP5BcctDtZMCG6f0unOInJLIqac6y+r6
	 MEMcTkfYJEI231Xgh66Ge8JvI60t3gQM1QTXCL/g1F61Ffhu/JVOQmynYJCqq9WWJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7YVcPbR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCWFZqgE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284D606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B284D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7YVcPbR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCWFZqgE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UpRN3371295
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=; b=U7YVcPbRZ4xI8hzq
	fqHGtrlavcBRFDZ3lBQuSQBcdaU95Q118jsCERIcpMantFmIDdFLc4TUEjd2AOhZ
	ywAPGCeH4HexPJeg3cZsiFhzxlvxAYbZsHm3UwO+YF5CYdf5nL05bUTEvS9ySAEU
	ywLwsXUL6tlqNordU/LqWVwUEQpSarx0HMKG/L3B9FniywBdq2bVWAD0Ms4GAA3/
	+EKjjgv9BKVM2HsY8S7+NkcLd7FbThB3WvmXsy1pvYzOTUCq+oCcdT05jZdNMF0W
	BVCkJ4t65DE8hzPe7lq2Shqyrn+gCEsL65AYBHMLkD0Lez8w3JRSqwR15PjUY8VT
	K1EC2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8saw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:24:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso629971a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979457; x=1795584257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
        b=KCWFZqgEnqjXtnyE3LVSwWiKeOLC7rfSCRALqZ7DgBLxNitr8leQ9yQyidYZ/QbqHG
         rUalU4qPqOnTJKBtsqXM8i7o+uWpCslnDi3ApwxiPIW13Nz8Eh6g91uoo4zMOHXsIX1j
         XVCmVDogjXPRcholnn11xlxBnhS5aBTXf9XDFxeXHIimIXP6H0czIOGcR9Yu1nr6E5pW
         q5H6niYElZeT+Ir58OrOsqsO/usRj/ISE4ofbJ/tJNWRyqGzt+fd0cyw6/mU3FymsWP5
         hrWDblyqMp02ovqaG6nmcmUgMayHvekmn6HWO6ZOCtIQNKJh2Tll7/khW1ztiNVacCcY
         1b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979457; x=1795584257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
        b=2ImnZoSq6lxxhtywy5A4nSOzhBo6av3KhpRKEqqBLRY4gQeBDDkzxSMK2E4IhQGTJf
         2UZMRp2KaAtUVhCz4TDN8EXgC4XrczwePXxjhcsMbLSd9EVhHrHpoeaACz84L0+rIi45
         cN1ET3O1KbACGBbZkAkeSBoY9Xvlcso7OHHO5e7reaY/aA/VeTog6WTGiCoyV7VcbbQR
         Vc0tlByZ7zdM5mnqkDoiGz0aqcPKPwSNBUO6ONmi5fs9Qmh+GtjCofzcppLfsY9ayPEs
         Ap2+5KwzXiSbKnT2fg8ald/eqmFFKIMfF1Er9VM5uF6p6W1rTH9YNfMMwiXlG8GIS3Z7
         39aQ==
X-Gm-Message-State: APuU4Z98cX/8FEyQyKHk/CZUBQKGbOxzUuUQdSzlQ/mPE7HHfZxRLser
	DehLVrgs1HUhJXB2HK0VsA2GywKFY/mp4kzBw6oVVINckNK+nD+pdubJ1AkDz70ilWSrP+GkbnH
	wLGLg8KUj6Rr4Jf+ioHJJhgvWU2dl1pnfCe2qWQexYF/CQJUNV73Kz6Vhw4wFAHTL
X-Gm-Gg: AZFdTZexT1bjCXJEPoMkLhRZumnxS9may7Tu9R2/IOgQZ8ahmfhJpNtsS4htitb1roX
	xKFvVKn28H7KtJP8vi8FRkCRjwKPPQ8plKbxd6ybPe05/gQ/e/2q5Xmgn9mQNjRBOkqhba6snN1
	oxE9QR0QDg7I+seZ88D8TIc1DnJSjPSRdxB+nc2VLb3AkbqtbIYHLwogaiU8wym0UagWNP6u7cz
	xRlEHt96FxJ1vndKWjkBibMrYc1+i6E0XBvjbel65ky7olrIpEb5F+1lt/glLw+UV9uqR4fwWz1
	z/WGQVtE3oaztDZD4PmPbc1PJIN2pjUPYZtC/+kU+tRZ64As5UE/oVoqjZA23RdFH54c0fHrMjK
	OxF46OZvx5yHvNCQJKMqu0fbDibRmNANEVwS+bTkiwWVIOUKdntb/HZDTHTaHr7obCjg14I6PH4
	1MxS939Sdd1A==
X-Received: by 2002:a17:90b:2e46:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b3d07d216amr1465599a91.62.1794979457107;
        Tue, 17 Nov 2026 21:24:17 -0800 (PST)
X-Received: by 2002:a17:90b:2e46:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b3d07d216amr1465584a91.62.1794979456567;
        Tue, 17 Nov 2026 21:24:16 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61841aasm6771165ad.34.2026.11.17.21.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:16 -0800 (PST)
Message-ID: <cc8e97f5-be62-40ab-81ed-4f23e50bb14a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:13 +0530
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
Subject: Re: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210929@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210929@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd3681 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G-y7d_-i5GkObnu5dnsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IqdM3u7FHTzFqOzQA4OpQcJivUlTnSjS
X-Proofpoint-ORIG-GUID: IqdM3u7FHTzFqOzQA4OpQcJivUlTnSjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX/mTJQLoLEZ5D
 a9gZuK4RklDtQApDSWTz49Q4qoI1LwkWGIjmNcW6mYJnnve9gSC83id2RVZ28gtgRPyvSZilrVT
 okVXwFAP+7vWK2xGGC5vncZTwVZwz+NqaVbWU8tR4xX6Z/WRy+MEAlzNXpo/n58YGFRwH7+XuXM
 hu8GeOFYDu48/CfF/3sRwqyNQcUgyAWsRI/uX3YBQV5UQhS8Ovlrz5uV2DA29xq6reR5UDQxLeU
 b8vGVA1MJQdI+ifukqpwg/vSkeaPYpH1Gq6OD/3goshWj3bVwnJmBX7u8AsIFF6XPNMk39AW9vV
 HskBsswdJiEqVPBZnzhfJBdWYknLJ/3VvkJC3+uRCtieoUxWojuW3Ry0qcNfX+jra1ZjWAdvQpZ
 cu+1NnkjvVlsIaIoXzD1dlwV1/0c3kOJRzW2YG2EqOfVGrr13Nm118bDNU/gokVOqDg/1XB7b/v
 nuSSd1mvFgkpV4i48bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX+lUPP58m8dxz
 nEWSM9oDsVPam3yxJt9TZda5wyJhOzGISLRam6qRcpSBIolpQJGfiBDtnrJFfchSfmefADF4H+L
 DOAwyD1oJqw8LRLRcXn7op/Dsdua7Qw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180021



On 11/12/2026 3:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: missing sta_set_4addr callback in
>    ath12k_ops_wifi8
> --
> 
> commit 6de3568cf375a8ba9425721f1a8ad36656373d50
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
> 
> This commit adds a dedicated ath12k_ops_wifi8 ieee80211_ops table with a
> placeholder TX callback and existing common ath12k_mac_op_* callbacks,
> and hooks it in ath12k_wifi8_hw_init().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
>> index 92c897de16f4f..30188f4fae022 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
> 
> [ ... ]
> 
>> @@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
>>   	},
>>   };
>>   
>> +static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
>> +				   struct ieee80211_tx_control *control,
>> +				   struct sk_buff *skb)
>> +{
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +
>> +	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
>> +	ieee80211_free_txskb(hw, skb);
>> +}
>> +
>> +static const struct ieee80211_ops ath12k_ops_wifi8 = {
>> +	.tx				= ath12k_wifi8_mac_op_tx,
>> +	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
>> +	.start				= ath12k_mac_op_start,
>> +	.stop				= ath12k_mac_op_stop,
>> +	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
>> +	.add_interface			= ath12k_mac_op_add_interface,
>> +	.remove_interface		= ath12k_mac_op_remove_interface,
>> +	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
>> +	.link_info_changed		= ath12k_mac_op_link_info_changed,
>> +	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
>> +	.change_vif_links		= ath12k_mac_op_change_vif_links,
>> +	.configure_filter		= ath12k_mac_op_configure_filter,
>> +	.hw_scan			= ath12k_mac_op_hw_scan,
>> +	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
>> +	.set_key			= ath12k_mac_op_set_key,
>> +	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
>> +	.sta_state			= ath12k_mac_op_sta_state,
>> +	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
>> +	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
>> +	.conf_tx			= ath12k_mac_op_conf_tx,
> 
> [Severity: Medium]
> Should ath12k_ops_wifi8 also wire .sta_set_4addr to
> ath12k_mac_op_sta_set_4addr like ath12k_ops_wifi7 does?
> 
> The other shared callbacks here (ath12k_mac_op_update_vif_offload() and
> ath12k_mac_op_add_interface()) enable IEEE80211_OFFLOAD_ENCAP_4ADDR and
> WMI_VDEV_PARAM_WDS on 4-address interfaces, but without .sta_set_4addr,
> drv_sta_set_4addr() is a no-op and never configures WMI_PEER_USE_4ADDR or
> peer->dp_peer->use_4addr when a 4-address station associates.
> 

This is a false positive, since the CP/DP changes will fill in the 
remaining fields.
