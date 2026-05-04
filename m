Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D5363C63
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886562; cv=none; b=pfRRxLwEKib47rvKKSHkEFCu4ZgtTDDOHZ38ou0hDrl15n8pXjxs3WI2kw0UCkmR9YR3bNmD9q90trHL8D6su8AYVD1CarSrTnDCE2+jNWoX98ZanR/Xvqe6iEMqfqpABbl8f0GfvL+dy6wWpLvOlsmCoTpyHhqF/DEKtO3guTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886562; c=relaxed/simple;
	bh=0MgFvCSDTuHg4QDgFxl4BQsxVp8Ywh+kfF5DDfLCKJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq1JoelgnZkEI/9nwk/rXg1GF7xrpC4jonoW2wzRY4I8JDhsLkJGVvo+Ey6sKO6Mn8SmFYD/jHkYdYAQwnbhQ1rCSJrpllb082Usmn4PZnL0i3uVlXEFKqQOQZQI3lwCtFk0/wm/XugQZofVZoJK5z6gcHrCjHWcNFDlUJB8M5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT8UcqmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDcGtUpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT8UcqmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDcGtUpn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448frRP3825305
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=; b=jT8UcqmQQ7n8kYzv
	d916VXBnBVQAm78wuEtAHyF33nuIfU7O9muUTVQLHdQqRCsxCnXUQgbmZ0fXA0qg
	VmH+gx1lXTg64WQaDkXccTDHvTbf9NCeimH7F3QvzoHpBClvIZjBqcRFZDiaKgiv
	5qcakwNqNRUSy/wv2UxnUomasVoiBjozKqMsvBe0/7eJysYubnJaFJGtT+FNI9ux
	OgE/dxTSRubj28Ew83LknbElbkH3kqwyMivwUvQUpW/TCMdouKIirLws0rS6Mw3M
	Qt8JuiFnIajoHlvcRdHSE5t+L63sURsDNn0q2ML7g9KvopCF3sLVwS/98cB8bEpv
	u27RAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3n42q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:22:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so1762549b3a.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886560; x=1778491360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=cDcGtUpnY6BZf4S7MEsYNlhw/H4RIOuySsW+tNqhyGUx1new1R7U6UQwAXYS2eBjXA
         zkv1xaEC5r211JGvtyaVyBZe9l2I+g0jM/DFFSbTGwSq0o706E4jLjMb01B7vHkNnlKq
         6PwRjtIjgEZXd5AufLVKkzR+V60OyTFMobWXcXxGH/n64a71rwOiYC5FmisKwh+rrVpB
         mFxu5CF+ETOOHkfi7HN4ojFhgTj6mzbMRR/rIVNzKUESFXq2SUq4QQxcla6BkqHK3Bc5
         fN2Yr2PLIKH+g8ahTdn91CFXhrfrBssZAVA68+o6KTTjYrsdCt/C3e2lWSkWkxBdWqsE
         zhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886560; x=1778491360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=GyWHGXbx1wZB4RgEemhPUi3izdcSl+usZ7L9eTkYR5UW58l2Di9BvkvIM68OIi3Fg5
         3eC6WW68kKLJNwlxkNyRFPxamDndWWjwXMAr9N4oVQxo+qq94BiacyCH/BUHxGX2deMd
         VX9vE0rjxWj94g43jBca3baUE+5vNYWb8jdYbUqxs3XlQmbZu+XFEWY+7fxx4rwpwIZN
         w+IFE6kA9cUaDd3W00NnqFYK2oIeGezZcXcMMErxvYemvueow09K1cudexpFeg5ps+Lk
         NeNeGwYFHQumrRrJYBMiVna1L/UV6gJpJT3vskkbFiJaQnTNttCtVIzd2errmSRXbgdK
         5YIA==
X-Forwarded-Encrypted: i=1; AFNElJ9WlMrUv4AdKI2a1qOFVc6nXsZVNIga3H88xKFjuzS2b9WUMtJKruTc9CJ3VUe9VHFh/76xH6m+wm2F@vger.kernel.org
X-Gm-Message-State: AOJu0YzJt8mJZK8j35TpT2HdNmgvmESDbuWIq08wyPlyz9k6rerZo6rV
	yH8K0/C2UAOn7tSRy9XKHGD0hjiJhEdP8e8tWVympaf9NmoIfz/uqMLPwSaQPkfhckUJrFkz6ec
	x7/l4IWa1j/Zx/YdzccA1Or8M4WTlv0m6bhHGJFZKMU3oiU3OIJa7eoLaaSzTQvByZGYuHZ1B
X-Gm-Gg: AeBDievFWtErknZbnIFtLnAbGMBY+yaibMyCNzeU0kkFHOegwL5HaDBH3JdEdCeG7yo
	U4wLWZdTpGsFwjlHm6UhhGoz59TNdRUelHFJ2mie0DsGI3wGvrygY3Wu4n7I2WkYvnBG9jQHsc+
	yKzAuHUqBc1/jpBfPKpkPN9orN7csNzbl+0MldhvQo2kH2xsCdC185aMbpOxrwo28dLmMokZQFk
	hq5xsDgeqebpK5frPeAjJR4kxzER2qTvzIngjt9Fot5OQ2R8Xa/pIaC+PnVokAllJP2O/LBHY7X
	/2XIu79I0G3Lifh0Gqj5ftpqfr7muGC0g8JOMQPiXlSsEfj7KlpUqZ9Lbu5YVQyOTiLXLS7c2ry
	Hy5snKWcuryiyi6fm0ca1Nbr/wCK9/tUYHhSG6YOzULeRhB3BGL/etB7yKm+2Ng==
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936685b3a.25.1777886559700;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936668b3a.25.1777886559217;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83775b1eadesm3030462b3a.56.2026.05.04.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:22:38 -0700 (PDT)
Message-ID: <ba8c170a-eae7-418a-aacf-92b394c401b0@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:52:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX+GNz31w6fKIx
 jB0AzCy/XlPjP+znvAbJadCexAeXux9BtPuDivk5o+Rq+Gm3xpt8VL5W1GqjD4tQk/TfixbkfaE
 GfYOxVh9qpZdBNNzxJS8zhAVcrJT59ClSzver1Kk/SEAioj3JMpywgIV/WtaWsVUxCZ8IH0IuBH
 WPjDhaptsRJO7WV66hGm66H4wfrslr28Li8S9pITxx5LHDwehglOa7J6CZfBUVuMi5LVrnYlw0m
 QbpGgXnFn++Cq1OXFCBRb1cAnHS1U8fCj9tGU8EvhJoxy6EcjrtFDcCQAQr9oZ5jXvx6zxTQl2Q
 Z0ZkSK4VZXuDxisQoBpD1SApurebrgnQmCxmKmq8F4gcfqbg3D/cu1kE2KVoPGnakbyqn0fPL/i
 Z+QzBqvGQyI7jYw6xh4qLUzrP48eStJtTGjd71rVdV54nAJwlpPvqAQQoimzfOkp0t52SkPchc1
 15rAG4/5IAYtxs9C3Og==
X-Proofpoint-GUID: uxaTx7bfvGKstZJyq-GS_GZK9R2fep6v
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f86560 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=58GAH2X6W2vqmnVK_tYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uxaTx7bfvGKstZJyq-GS_GZK9R2fep6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

