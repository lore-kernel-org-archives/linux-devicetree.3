Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A434183C9
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545211; cv=none; b=IKzNJltXqCOf9W8lFD6IbZZVqJX9kpg7pzJ0mlbpfyYeCKQr0Tr45Kd9dIpWgPMRaBnGlQsh3HmGQCxu1cMrXKHBx07UHVCMTJ4qiDRu86FlU4W7O09W7jMSf+GUGvOg2R6veGXaSB03wUwflihh7oTbyXzkx/k6KkGfRQZ/E7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545211; c=relaxed/simple;
	bh=cgDCf60D1ZNChtIqUC1HmxRm6m46wBrGxdjrgS0ByM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvEKDU3FyaeqXf/MOssgsoTjYNKA1QfZVjLjorPRq3jrvvnNFNlktP/nZT9G5DS165mNGb+oJRYjUFB50e9fzoH8M9wU/e9svz0y4SemOa0Y/OIEyXEi3yw9Lr3VbgYvW/l6rc2XAV9R80VaXJyVOGRYaXNVKi+pB43ZQ8Ptdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0pG1wD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0q5QVu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0pG1wD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0q5QVu1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhMJH430424
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=; b=j0pG1wD+m2K1K0m0
	7nG9hYcZJyCznKklM6qJL1+5SUqyBdkzjaEM6LKhuDKAtKBIFzz+FVyXGMGK4K+e
	9gG96BrUzHVaWO5lQSgaOf21xlEDY+NR+ja19NMMuSVMNkznHv63J1rWwHk6eBD1
	z1gwOwi2/GXXtOP1OHeyWyCYIIgGogsPi/vogtl/bsJWWh7hGgyN001UDRQN02ph
	M0/5JPdM54+VqmOqnwbLnthxFKJ/xZTmzw8QlmulPxQSAt767rBVADUhC85Q8wwj
	iOhYfeUCfaG1N7DR4DdyLKoZypfj/qKbKjU7JUQqIjErdBizHbweNT61xhsirFja
	hfD6aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyda2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:40:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2647172a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781545209; x=1782150009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=;
        b=T0q5QVu19S9ukJmjwZaViVMuqDrdIiXuf0HbxnaBljbpXkuEnPcGUNidM9v2Mo2WGz
         gB5UmE71AdpzJzHwPFnPLV8qYAIHtMz41h/zh6Lb7mDtrBr4EcMNNLDk26DMXje8UfIc
         SyQjpuyGiQ+nAnT5apoRhJENurWgJsHRsSO6ZK39EP59yiF2vnGjiiVWP/ceyNERfvUS
         cxySpmJFBOTNef1IoQZxmO2SXQoTWPr+32UITBQph8nC3bLyA8VTWbRhm/nmyLIh4smq
         LaQun6zitF2ie90NnIEhNZ9bdbTym80iIm8d4GKmMLgUy2nnJqiUjqKrse9C/P0B0f2i
         fMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545209; x=1782150009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=;
        b=dK1vEPBjhaVwSNRrj2+Y/jUiWqe3iqD/fqQnfo1oJ/FOECuDf9bYtMDooENtGOp4kf
         /ASOetvzMAgh3OZtuFuozucJbMl+DPud5FqjqVMIPs4XTBp1DUN3skB2hgtpj7kbb8eT
         h6DQU5BGH+FtwqXKIueJ85E42iQBqrzcOxyeCoy4SPxavZOEsEUx6Avk8JXmg5QCpGDM
         Ik3Yir7bSNTscIeE1ZT1jTu9OsoVVYHzCahxkLnl4ogBo1+oMuUKnknXC9RJ6QkWjAW/
         bCP06lshfOFzMi47UTm+/pgXNoYdDRLFoPRkkN56keu8RoIVL0LJRuq/qit9LcyPPdvn
         Nmnw==
X-Forwarded-Encrypted: i=1; AFNElJ/ydxOp0Q6P9jOKRYD8dPyg3LwdKknFlHTPoLq5vsmnup31T2UGnqCl8lXYyTqFSeaj9nN1lG2Hxpgf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgagk9dXojGQpMsPZQNyDcFfdUbCpS6NdUGXQgYSs7p8Nmu+BT
	iRWUG30ueMwbhmIG3TNaWb/XdxsaDq6/I8eJqyuJvPWj79kHzIPYy4s7eX15kXpA4SPVOs9vq9T
	4IkBxNjVxVqFvqXthZcrNDG2qjNoG4jBaH71S3MfP5kEHM2f76PT8WK1fop1Q8vYc
X-Gm-Gg: Acq92OFpOTBkH/JM/dF6BuU8ZqbTB125fvofhV7Lugjx+AVcQVXr9wYu/HEwhT4kakS
	j5/OhW7wtyk6DwcmbrqrzVG4qRyR1yb04TWxk2ly8tZ4cQ3L2l/JExUggXHcSk8wSOpsf/o/C5N
	VhXcFPJoT9f5hsIFJulzDIz6IbfEJE8HXXiy3gqiZ142HHFp6jgK4dGjwXyyemu6zLcyuF+8qvY
	o6/LUkzN9crvqRwmuDayS+I1Zca2y1XdcNDW2XJokLvV6f69RHpVRbq88Og/LG/mszINwY+MnkB
	1qdDrc70n4pCHz5HoB9/sjzljvlj84nCE2nQ1ZE29c/NJTA8mZFDRD3tn54yT313COtKA5bREVk
	axEpYtn9C/OjtUJjWoEzMtWgQPrtxeSioQKnihOf/kcGnT5mEm9itxMPeeh9sTC/mXg==
X-Received: by 2002:a17:90b:51c4:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-37c2bd5c7f3mr11720616a91.24.1781545208982;
        Mon, 15 Jun 2026 10:40:08 -0700 (PDT)
X-Received: by 2002:a17:90b:51c4:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-37c2bd5c7f3mr11720591a91.24.1781545208484;
        Mon, 15 Jun 2026 10:40:08 -0700 (PDT)
Received: from [192.168.1.48] ([122.164.85.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e7b2c312sm6933191a91.1.2026.06.15.10.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:40:07 -0700 (PDT)
Message-ID: <a1501ac2-277c-4993-88fa-f29f0123c8a4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:10:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
 <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
 <f2e9f59c-3de7-41e4-92d9-88f91955175d@sirena.org.uk>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f2e9f59c-3de7-41e4-92d9-88f91955175d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eqz6rxsm1s_C6cvEKmA-LrB_Kf1pFhVa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4NyBTYWx0ZWRfX/RVPo0wN4xDf
 6yqDi4ukmSEqbqc9qlKVrSiNDrAqtMSOd+V0YynEweAeDIXdBt8jjK0RsjLMaVjuyvt4ucRXiY2
 t8yy53xNGg55dfWQsurwyfRYu/YI//4=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3038f9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=BchUXt3FRQcObq55vMoYrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3IG1bLz3NaerdrZfOx0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: eqz6rxsm1s_C6cvEKmA-LrB_Kf1pFhVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4NyBTYWx0ZWRfXweLiqumPjhYs
 crykk3Ub2DmDwkwTAF88osppvaBWm/1U/cITBcR6D3Stq2H6HEIy9obr+O0I7JEU+55Whsj23Lj
 ZmaVWw3u4eBzP8uRzdTskIkGHvzwAyPIZpWlLqbMXDQFDFYFP9EYfEd3zssSHF9WMM8Dad6LA/R
 0bskBknlgrPkuFHGh6cOKM2PEYy0IapjvGkH57QuZCxULaX7PupLbhIrf+PxohAXFrFUIjUAFHP
 nzjAcEaSD6oo6Xv4Bz9fPuu3cQCQieJe/WOfHaSz34aWvcknSRw3EfOG2M6qOOwaDmF0cnmJwsD
 4HfrJt81MUcDibKaTOYb70m4jkDxWzZ1WGRK2nDLxQ4HL/gBXsjoRp/mmNtCN1IPoQ33YqUn5h+
 79R7KlD+Hsyo9ez65paTrQb1EASvC6IJjDSzuKu4SBoUxQ94ZNZUZo6SoamXrncnkGw0ufi7xDu
 /08t56/TxL6Mc4Tk35Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150187


On 6/15/2026 11:01 PM, Mark Brown wrote:
> On Mon, Jun 15, 2026 at 10:54:26PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/15/2026 9:28 PM, Mark Brown wrote:
>>> This looks like a get_status() operation, not an enable operation?  The
>>> enables and disables are pure clock operations.
>> Thanks, Mark for the review. If I understand correctly, I should track the
>> clock enable/disable operations and return that state in the is_enabled()
>> callback (as I did in v1). Please let me know if my understanding does not
>> align with your expectations.
> Yes.  If as it seems the device can actually implement a get_status()
> operation the driver should do that as well.

Thanks Mark. I shall introduce get_status() with STATUS register read 
back and update the is_enabled() to track the clock enable / disable 
operation.

