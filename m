Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC14BEE5E
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227163; cv=none; b=P3PyQhrQScQGuXyVOgNtk2pYWPEATEEeBj5SXG73Z5MN1pshSqAFyJKlz5BRkhgxXFd/vWH2krX4Mm8pmm1oueBW2IQvGEXeAWxprvdNrm/m55vhGpaS1KEnPnkxqAQdjQf7XW4IjfFHlSlV6843jkRVPKmNQyIgK5hQfXhIYFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227163; c=relaxed/simple;
	bh=Gj2WKPwaXMtJYToshXOewcWcdTEU6qlzHTUOElJEb54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpbFNyRYDCZmWLNSgPaf1WAKFNNN86JDp+PGUIy9BP9sQvFJzmz5hS2xwY5ZJGmkVIEH0EY5Ds5KWQyZ9rDIWfOKCUamFWSh34Xjjli3KFXaq6oQP9mZQWciYaQwnm8bclPLMIaL8w4tqHzmX7zQnkMH6+C5DgyQCQ30yj/M/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzLni7VN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCnt+/H2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLni7VN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCnt+/H2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe3i52074839
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RW+uvZMapCNlLj6TCdNZsvYo
	rpF2ANJfi66sX+X8hEQ=; b=dzLni7VN6Q5Y8HQxG1eEpMItzIZWiOXir+NanzuG
	Qt01xqVYtx/hbumS4ZigLS7Zq4RP19TirCYI13qZfLFy3/8On6kV6Dr6xKAcgx4T
	7FCopa5hKjtAy8BSmOL2VXvZTHyRJ1a0xpVj7hDBoOydhbdxN1q9Vi0TSs6QrvQi
	4MQemvDJqmuijA7N6Sr4H9Qi4NTOuTwvP8j5KycsIeT9xTThxQkjfYTMF2T8nNQD
	NnX35+UCwSRDIgofol/c7wSuUMnAw8BX8ekI3LwcvJZ1ustsYxyDez8GIZlSQ3vk
	Wj8eFLhFNWFys0tgKI/MdqMg3/++ydSm8U3qSpqZrm+4ZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh166j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91214e93c2cso22682016d6.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227161; x=1789831961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=KCnt+/H2e3LBFu1DdY/PFK/t0L4e42nqX310qpPRSQbu6s/8YCmFV1ST1LF/50BjoB
         STx3Zn2ZWijp0N7Sqpjcz6huuRfwhYqMHGl4+4c8kwgFQZXwx2siHBDl+B+ewZq3lhI/
         09nv5UCR7z1/uI9EzhlKkiUcS4pPCvLmDHoXdzQFTd3lhL/dCKyVlj19v7B7JkEpzYtC
         2sSHtXn7IdfUzVa2pRSssZ1QGXxjnPnQpiJjkVnck9Cn4/Ewoj3fvf5g/AqMBhr7avU8
         vjrVn+qey+GIHjWUFpvZLDg5zPBT27qvbbx4WCKNbWC+5gsK71vFX+QF4l0W9pO8XTEM
         JMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227161; x=1789831961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW+uvZMapCNlLj6TCdNZsvYorpF2ANJfi66sX+X8hEQ=;
        b=N2iy92uLHyPguZDGgI9f4bAqKZIpflJUJ8XF5G+MFW0aAirJUcgvb4IE/h7bjhkyqr
         H7qMYwX5kFE9aRM+GrQq+iwxN98x0AA1DhT1pro9dK4UBRwZ/bnX/WlmZs7QQL9SGHNy
         rN+tSf2q5kJmD6eg+oMKeYylApdAztEuinGwWkhyK62jE5rAY0ZbFWP4vrIunkvi8cXz
         TFSjLS94ADAbrHlhGohIRwPF38S6IwdvC8/ON+bpArGjmiCrixM+bI7O+FxAsUIk/r6w
         zWJgmSY5QZiTUKja5YfEj0MF2FurSVm11FpaeubXA5bEJKT0Mss0AZQhzs1fQ5X/dl4b
         ktAg==
X-Forwarded-Encrypted: i=1; AKwUvBwbOU/8ZbsMePksh+H2Oi87w05ZD9xT6Cb8TYNVvZemk/KVnuOzwNYkzPx2wRuw0xFVtxRNkPLybKf8@vger.kernel.org
X-Gm-Message-State: AFuF++m2I0F4lXUIcIdGUuW6ZI+p8X/OAj4cAHJXZr/iMjuzKokyTfPm
	TupzbSkJFuTXq0WT/7iL/sdZEapQq6I9SxNiIzxSotmvAHBN9EtaFWIcE/a3cN3+LMa+H7BrdeQ
	EeIljHJhf0D1DN8N6nj/Ipjjj5HZPF/rq3PP6ogBGt7AEd+BN7NiUjYncRPzJMzco
X-Gm-Gg: AYBFou2Sscyaxog5ylXaqn3Y20fg16/0xructju7ak7W8rlZmJSvNZWngXzUkMVDbb6
	fWjNTdTUslhznxg2nwSjaXg7LwaQJDi6f9709CJjrEA6x6YfcX/tQtk7nKXE3oD1iQiotpr2PEB
	eYq48XjB7erZgOkTsX3/Rnyc4sztlMIh+7eAyMFsmcvFdagr7YDo5wkUTU5GxR4SuP1GqdHf+Sc
	orpyAeQCsvGKhByqapCYB3yh4UPxK47gb12dFUl1oBvzMnyts1YuoNPRBu4kScdt1H/vm5B2wOG
	nZk0dCODywG/w3ng0a3YFC5Y/PgHrlLnKJoqCthsACUMcXLtLTvn+R/M5DTMho+qsxakPoV8NMr
	E6G3pBS46izOZUws=
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739525685a.30.1789227160506;
        Sat, 12 Sep 2026 08:32:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:939:feee:630 with SMTP id af79cd13be357-939feee08eamr739519285a.30.1789227159987;
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm13061375f8f.4.2026.09.12.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:39 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <uqusqjipcssrpmphugludj2yujz5jipcnjukubrgl6wdjqbrh3@yly6lsgymdf5>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: bX6OQDPj9kHTwvgtaXMUVH3qjc_bhgT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfXyRfRiqZwUUFn
 3tRXvc6Q7EEsJ6fuiOOqBAxrzWawo6QOzUegnpaUsHoNTpvDKUzFRuy/s4JYL9f78pQt8qs/yKW
 GBHuhdlDpFsjyErL1wCXvpMXGNuuWxLcSzgk14QEfXo6z2M8ezrTl00mz70vZtKSv/aDMkrWHwh
 XDnBDa/KkGd0LR4nGesN5wuKH5YqCnrAumvMT1aiDM2rdpt2nu1FQXCccKictHcyQ+tdIDGxybv
 jrvni7mHjWJ2qsx2syI2/IiBXgl847PwzVE9OzxI9oOv/MMndRq0ioRJ67vl74keTA++GjHoZJL
 4kaqI9I3gOqbu1q4XPl4FkhkHSD0lofXMIG3TQIlKVG5Ax+QTXiqvJKp4e/QD5l/j7xyPEteZUg
 ZqdruZ29q4nwJv05vRqZIkmnuEwrzjb4CGGdGU8WCLzHNH5jKQERpQN3dbBufeDGJatwnUe8SR8
 U6KNpBRUrgxo1ZFrfVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX8ocKyA2gbKqg
 4UmgG4SylGzfMEFl8oIH14LhYY3OA2DM4jSF+HajsaDlomM6FxbcBOrl7hvdjmbjVL2U+DZmfmP
 5dW/1cWvSgRwLWDLbqHOn0lnhXAyAX8=
X-Proofpoint-ORIG-GUID: bX6OQDPj9kHTwvgtaXMUVH3qjc_bhgT5
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa57099 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QHX0HLVNp1UGJ0cSOcMA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120224

On 26-09-11 22:20:37, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.
> 
> USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
> capped to high-speed and told to use UTMI as its pipe clock.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
