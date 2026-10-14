Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F847B43B
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962465; cv=none; b=OQnSKbz8RJgucARc0jDl6oMYr6pXTg+9k/0BtL+6kaZP4Gl50ly4Nv4v7etI/dlJf8u9fqBaCIiTxfhTuF7dT7SeiI7aW2d06KcFTPq1RaHWmp5T569HSGbQ814Oy43PLw58MVnDhxIIRODg1GZa7GAor8hIao2omT+IyRp9qP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962465; c=relaxed/simple;
	bh=dJv04GCBfv9Q9OqQCW/KCpqg3mnXeg8ey1h8IgH3AvE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z9mlw/Eut8c4AJPhwpAMlK2mfmAaAYxzM9WdkEWv1mlFKhOyuGRFjA33/cElGsL7Ui4BarCHUSM8nWcHGJYxPrNdERwtl52mncjA6h13KuFgJrBg1RQg6dkKflTiwS197tozx5pR1WkaTesQgIt3tCLSzbf7Kt1x8sYQZHDqd3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrazKw40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e96y2sQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrazKw40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e96y2sQ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1cews1592450
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=; b=IrazKw401apH70ng
	ZG35AdfkadcMTRiGauT8oOeMipmvv6JiHOVgf4rc/iIBJW7AaLk8EJUr2hSFIT5n
	NPIXUW3/lcDwy5JMCSz0QGRv41mmm5qbMHamE/PYG1MfR2gEQlKhem0ckYhB0c1r
	AxxDqa0IgcArLWECWVtYgjsJn8sXzc84b2AasxCFuBgfsPp/xTTLCiDDAxNUulHf
	eYQjLBi1AmpkieaF+uja4aO78qH5PnqRWZJ1cTyokXnLSyJ1r+n9OWp+kAcm/gEL
	fr5l/aAxVfUEPeeKI7nttH5nnzTa9hrkP+DPGeLPcIcJalNUrH9Gd2RmkqyDK4CU
	fGsd1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjxeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso76947a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962462; x=1792567262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=e96y2sQ0uT8AltmlRQ91JCzfjCfUzmpZ7ZNrMimJUj3sHXew3JpfcCSJt6RGTPMYVD
         gQTE6zdsEGuPCOvq3CjFsHES3bl2zlLqOJX6SHw+yBMfLOA2dH0E0qvxfV0zfjA6h+ze
         J8GfM3J8pfj4z2iY6h0JjRYpAUK0bhog1/DpfAtuuUXmCViDMB+gesZLIHQ0QQ7cbq/y
         542MeJTaT0PvTTklxa/uS4iasNckk79jqr5Z+kR7ySBVm9Pb8mNRr46rY8cEpcSK0Foa
         CU/l/4zh6NaLYS37+npq++3YAySbYxpKu93t+27x2HhGj55/LSkXxKFF8Ygp82nzCtz4
         qHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962462; x=1792567262;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=WfhJMUV+RaZWdWBszgpmhcQG/gwLknE54NmqAxq0TzWNWjG9vd6iUnqB9RL/c4Gn+R
         EV8p0JZo1zvGFpWVhtsCetln5THQQgPNj7DXNZ48XXCHBk59pNBJXzcsp68S0tWbzohA
         gYSWztDt13ibJ+Ir3xI+zutBibgmt9OFQ7aI/LaxCNlog2SMi+1Toz4m9SzYH6TCBPc2
         ZhZ22RpUSd8A/Q0ZOuPKbwML/JwOFw9QL0EtH/rx/8hJSu/5JoxjM2pKiSepgCv893n7
         2FRNYAImEtdxhIW6Z3mhbgkAQUP/Q38IXBFYc3ph+WFjVa27areHLppDQ9cR4WIbZgID
         6ugw==
X-Forwarded-Encrypted: i=1; AKwUvBww/vTSIqVIBTym72PO02vXLcXM6WC2Zn6B2Sy+86k++XgD1k0Kwj/mrpnZM6EsCbiVJR/Aw03iJdrr@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9IyIRpIdM17zEpNQ43qTtRXqHETVm6ckYdykSBVi3oJozenOh
	tQR4jdi/kUhW53cccnF3RZDDBmubNsxaxBh6KV+HadQ6gfGyL7K7cgNCJa15JDhv7+qY3G7kYUJ
	xPGi2a9xpf9myv5F6DUHmnqAg2jElXGmT1czxa5rcozBYqMJK7EggRqRrSBZwwIhO
X-Gm-Gg: AYBFou19rkLcbS5RiYkCDHy4mAlslHxF0LYxduOTtqKTvCOa4vwHN8y8KPIoSLJ2SUR
	eA9IzEDSzQwIMewb7tJkjb5F2v4uu8RMIyxXWnnGB85aOpdDG3i/RjMyk01W7CihTPsSFf4upX/
	Q7l0lS8mFxc+qiqy3xaG2fO9IiZGE6yeQiNyOKMPUCQmaCzBh8d6Ne90APr8IVP1/e1Xbe6EoYu
	O3aCfboG7PsPyglRN8OqwF7ofkJzFqRk3ZKIDVy4YXKLtKAeE6hhTnpnFIJkKLx1eeCdraZn7Em
	GXPRU6w/zFWeLDeJSxwKPbGHwVTQdTUUHAfEvxoqYGLQcqIiM8h7HIg8h247hTQ/YlGxGC7tnvs
	ItJC7lLH87h8xCVHGfVmSu3Sq2gNWHG4wSdukfc5SuANs7D2Ufd2LNMq+jivOz/OSOQ==
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528245a91.50.1791962461347;
        Wed, 14 Oct 2026 00:21:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528187a91.50.1791962460699;
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm3549219a91.7.2026.10.14.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Message-ID: <56401e91-6d8e-4489-ab34-ee25af031a74@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:20:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table access
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-2-8c7b057e2c43@oss.qualcomm.com>
 <179181020968.434549.112728167970187942@kernel.org>
Content-Language: en-US
In-Reply-To: <179181020968.434549.112728167970187942@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf2d5e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1_IYofuslNu8jKGPog4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX3jH8qPmcnwYS
 YsR+Cm9niqUBueeWHYwq3qtkPl1v1m1SFpJi2rfqNbEp1X0tTY3awnKPDRzuI8O2ZM1jxsVzKYF
 f92jYyM6eAv7URKKRxqRoftiGbccSyHWs6uwPdXGsBxeKu2+nmYHSFaZ/tB9jacxRoXhyy1H4//
 ns0yaPB5X24k6Lzh+GW19x/6AdmOX+tf17nkc6hyozBPgew22JDrFhVgHUqkyP7eW7UCmLUQ0rt
 e3RyJsfqkmAHmWCK2Q6Q7m8i/7xeN6D09O0uh095UTDlRJGUCgaYdVhaB+4Hcms+Av6x5YEAkiZ
 Z9dZqBKBovWlzZxEwxLT99SoKHpAgzS3Js7QccpEyOcyZ7aWi7sMfCr6t2N9kpmgoKvHmnM1SZb
 X8ZgIjtOOKi3b9wFo/9UcolnG5ioAYUWXwffR9vmWQtv+QSj/pedO61XqC8SqRnDhzab6JkXc0l
 KijiH5Rf7jkC9nZrviQ==
X-Proofpoint-ORIG-GUID: VFNqY7JsMQ4zAUct5lYDTdWMakTxegNU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX68uAjhGioDLd
 dLsRjxRP9iqkCF/lHqdiA+tlVeVEO/upIly7l4hFxDCKcNlDvmz2RueqO/8MzYQ8X3Dj1v2+PzO
 tsgLcHL7ACKyWQ5ofo4z/H1aroQ/LrA=
X-Proofpoint-GUID: VFNqY7JsMQ4zAUct5lYDTdWMakTxegNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140029



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> Fix it by converting the queue ID to the index of the multicast queue
>> configuration table and accessing only the 3 words of the entry.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> [Severity: Low]
> Should this have a Fixes: tag? Commit 806268dc7efd added both the
> multicast_queue_cfg[5] declaration and the absolute queue_id indexing:
> 
> Fixes: 806268dc7efd ("net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574")
> 
> ipq9574_ppe_qm_queue_config[] covers multicast queues 256 to 299. That
> means kernels which already have the IPQ9574 PPE QM code take the broken
> else branch in ppe_config_qm() on every probe.
> 
> Since this fixes code that is already merged, could it be sent on its
> own to net with the Fixes: tag, rather than as part of the IPQ5424
> series?

The IPQ5424 QM configuration in this series depends on this fix. The
issue is only theoretical: it was found by code inspection, and no
user has reported it. So we would like to keep this patch in this series
for net-next, without the Fixes: tag.
